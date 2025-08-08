import 'package:get_it/get_it.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(supabaseAuthService: getIt<SupabaseAuthService>()),
  );
}
