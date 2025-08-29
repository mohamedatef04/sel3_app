import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';
import 'package:sel3_app/core/errors/custom_exeption.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService supabaseAuthService;
  AuthRepoImpl({required this.supabaseAuthService});
  @override
  Future<User> createNewAccount({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await supabaseAuthService.createNewAccount(
        email: email,
        password: password,
      );

      await supabaseAuthService.storeUserData(data: data);

      return res;
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final res = await supabaseAuthService.signIn(
        email: email,
        password: password,
      );
      return res;
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> sendPhoneOtpToChangePassword({required String phone}) async {
    try {
      await supabaseAuthService.sendPhoneOtpToChangePassword(phone: phone);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> verifyTheOtpSent({
    required String otp,
    required String phone,
  }) async {
    try {
      await supabaseAuthService.verifyTheOtpSent(otp: otp, phone: phone);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> changePassword({required String newPassword}) async {
    try {
      await supabaseAuthService.changePassword(newPassword: newPassword);
    } on CustomExeption catch (e) {
      throw CustomExeption(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<void> storeUserData({required Map<String, dynamic> data}) async {
    try {
      await supabaseAuthService.storeUserData(data: data);
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, UserModel>> getCurrentUserData() async {
    try {
      final res = await supabaseAuthService.getUserData(
        userId: Supabase.instance.client.auth.currentUser!.id,
      );

      return Right(res);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserModel>> getSellerData({
    required String userId,
  }) async {
    try {
      final res = await supabaseAuthService.getUserData(
        userId: userId,
      );

      return Right(res);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
