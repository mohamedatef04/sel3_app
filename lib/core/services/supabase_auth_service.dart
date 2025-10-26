import 'package:sel3_app/Features/auth/data/models/user_model.dart';
import 'package:sel3_app/core/errors/custom_exeption.dart';
import 'package:sel3_app/core/network/constants.dart';
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

  Future<void> storeUserData({required Map<String, dynamic> data}) async {
    try {
      await supabase.from(usersTable).insert(data);
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  Future<void> updateUserData({required Map<String, dynamic> data}) async {
    try {
      await supabase
          .from(usersTable)
          .update(data)
          .eq('user_id', data['user_id']);
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }

  Future<UserModel> getUserData({required String userId}) async {
    try {
      final res = await supabase
          .from(usersTable)
          .select('*,rates(*)')
          .eq('user_id', userId)
          .single();

      return UserModel.fromJson(res);
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
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

  Future<bool> isSignedIn() async {
    if (supabase.auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw CustomExeption(errorMessage: e.toString());
    }
  }
}
