import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<User> createNewAccount({
    required String email,
    required String password,
  });
  Future<User> signIn({
    required String email,
    required String password,
  });
}
