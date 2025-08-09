import 'package:sel3_app/core/errors/custom_exeption.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<User> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      return res.user!;
    } on AuthException catch (e) {
      if (e.message.toLowerCase().contains('user already registered')) {
        throw const CustomExeption(
          errorMessage: 'البريد الإلكتروني مسجل بالفعل',
        );
      } else {
        throw CustomExeption(errorMessage: e.message);
      }
    }
  }

  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return res.user!;
    } on AuthException catch (e) {
      if (e.message.toLowerCase().contains('invalid login credentials')) {
        throw const CustomExeption(
          errorMessage: 'البريد الإلكتروني أو كلمة المرور غير صحيحة',
        );
      } else {
        throw CustomExeption(errorMessage: e.message);
      }
    }
  }

  Future<void> sendPhoneOtpToChangePassword({required String phone}) async {
    try {
      await supabase.auth.signInWithOtp(
        phone: phone,
      );
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  Future<void> verifyTheOtpSent({
    required String otp,
    required String phone,
  }) async {
    try {
      await supabase.auth.verifyOTP(
        phone: phone,
        token: otp, // the code received in SMS
        type: OtpType.sms,
      );
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  Future<void> changePassword({
    required String newPassword,
  }) async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }
}
