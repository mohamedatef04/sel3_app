import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sel3_app/core/services/get_it_service.dart';
import 'package:sel3_app/core/services/my_bloc_observer.dart';
import 'package:sel3_app/core/services/shared_prefrences_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: supabaseBaseUrl,
    anonKey: supabaseAnonKey,
  );
  await SharedPrefrenceService.initSharedPref();
  getItSetup();

  Bloc.observer = MyBlocObserver();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp.router(
        builder: DevicePreview.appBuilder,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          return const Locale('ar');
        },

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
