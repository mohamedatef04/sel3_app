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
}
