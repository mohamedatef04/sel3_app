import 'package:get_it/get_it.dart';
import 'package:sel3_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:sel3_app/Features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:sel3_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:sel3_app/Features/profile/data/repos/profile_repo_impl.dart';
import 'package:sel3_app/Features/profile/data/repos/update_user_pic_repo_impl.dart';
import 'package:sel3_app/Features/profile/data/repos/upload_user_pic_repo_impl.dart';
import 'package:sel3_app/Features/publish_advertise/data/repos/publish_advertise_repo_impl.dart';
import 'package:sel3_app/Features/publish_advertise/data/repos/upload_advertise_images_repo_impl.dart';
import 'package:sel3_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:sel3_app/Features/seller_profile/data/repos/seller_profile_repo_impl.dart';
import 'package:sel3_app/core/services/api_service.dart';
import 'package:sel3_app/core/services/supabase_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(supabaseAuthService: getIt<SupabaseAuthService>()),
  );
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<FavouritesRepoImpl>(
    FavouritesRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<PublishAdvertiseRepoImpl>(
    PublishAdvertiseRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
  getIt.registerSingleton<UploadAdvertiseImagesRepoImpl>(
    UploadAdvertiseImagesRepoImpl(getIt<SupabaseClient>()),
  );
  getIt.registerSingleton<UploadUserPicRepoImpl>(
    UploadUserPicRepoImpl(supabase: getIt<SupabaseClient>()),
  );
  getIt.registerSingleton<UpdateUserPicRepoImpl>(
    UpdateUserPicRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<SellerProfileRepoImpl>(
    SellerProfileRepoImpl(apiService: getIt<ApiService>()),
  );
}
