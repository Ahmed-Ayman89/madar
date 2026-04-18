import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:madar/core/network/api_helper.dart';
import 'core/helper/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/localization/locale_cubit.dart';
import 'core/localization/locale_cache_helper.dart';
import 'core/localization/app_localizations.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';
import 'features/settings/data/repositories/settings_repository_impl.dart';
import 'features/settings/data/data_sources/settings_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await APIHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LocaleCubit(LocaleCacheHelper())..getCachedLanguage(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(
            SettingsRepositoryImpl(
              SettingsRemoteDataSource(APIHelper()),
            ),
          )..getSettings(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                locale: state.locale,
                debugShowCheckedModeBanner: false,
                title: 'Madar App',
                theme: AppTheme.lightTheme,
                routerConfig: AppRouter.router,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('ar')],
              );
            },
          );
        },
      ),
    );
  }
}
