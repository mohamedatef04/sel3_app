import 'package:sel3_app/Features/auth/logic/repos/auth_repo.dart';
import 'package:sel3_app/core/errors/custom_exeption.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService supabaseAuthService;
  AuthRepoImpl({required this.supabaseAuthService});
  @override
  Future<User> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabaseAuthService.createNewAccount(
        email: email,
        password: password,
      );

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
}
