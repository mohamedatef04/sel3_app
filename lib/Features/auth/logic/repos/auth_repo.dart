import 'package:dartz/dartz.dart';
import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/core/errors/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<User> createNewAccount({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  });
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<void> storeUserData({required Map<String, dynamic> data});

  Future<void> sendPhoneOtpToChangePassword({required String phone});
  Future<void> verifyTheOtpSent({
    required String otp,
    required String phone,
  });
  Future<void> changePassword({
    required String newPassword,
  });

  Future<Either<Failures, UserModel>> getCurrentUserData();
  Future<Either<Failures, UserModel>> getSellerData({required String userId});
}
