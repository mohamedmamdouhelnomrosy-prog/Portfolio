import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/Core/Api/api_service.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Core/Language/app_languages.dart';
import 'Core/Language/locales.dart';
import 'Core/Theme/theme_colors.dart';
import 'Core/Theme/theme_cubit.dart';
import 'Core/Theme/theme_state.dart';
import 'Utilities/app_themes.dart';
import 'Utilities/git_it.dart';
import 'Utilities/router_config.dart';
import 'Utilities/splash_interop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseConfig.url, anonKey: SupabaseConfig.anonKey);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getTemporaryDirectory()).path,
          ),
  );
  await GitIt.initGitIt();
  setPathUrlStrategy();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<PortfolioCubit>(
        create: (_) => sl<PortfolioCubit>()..getData()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()..getCurrentTheme()),
    BlocProvider<AppLanguage>(create: (_) => AppLanguage()),
  ], child: const EntryPoint()));
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  void initState() {
    super.initState();

    // Returning visitor: PortfolioCubit is a HydratedCubit, so cached data
    // (if any) is already restored synchronously by the time this widget
    // builds — no need to make them wait for the network again.
    // getData() still runs in main() and will refresh this silently.
    final cachedState = context.read<PortfolioCubit>().state;
    if (cachedState.data != null) {
      hideSplashScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLan = context.watch<AppLanguage>();
    final bool isArabic = appLan.appLang.name == 'ar';

    return BlocListener<PortfolioCubit, PortfolioState>(
      // First-time visitor fallback: no cache existed in initState, so wait
      // for the actual network call to resolve (success or error either way).
      listenWhen: (previous, current) => previous.loading != current.loading,
      listener: (context, state) {
        if (state.loading == RequestStatus.success ||
            state.loading == RequestStatus.error) {
          hideSplashScreen();
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          final bool isDark = themeState.isDark;
          final currentTheme = AppThemes.createTheme(
            isArabic: isArabic,
            isDark: isDark,
          ).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              isDark ? AppColors.darkValues : AppColors.lightValues,
            ],
          );

          return ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 599, name: MOBILE),
              const Breakpoint(start: 600, end: 1439, name: TABLET),
              const Breakpoint(
                  start: 1440, end: double.infinity, name: DESKTOP),
            ],
            child: MaterialApp.router(
              locale: Locale(appLan.appLang.name),
              supportedLocales:
                  Languages.values.map((e) => Locale(e.name)).toList(),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.noScaling,
                    boldText: false,
                  ),
                  child: child!,
                );
              },
              scrollBehavior: MyCustomScrollBehavior(),
              routerConfig: GoRouterConfig.router,
              theme: currentTheme,
              themeAnimationCurve: Curves.easeInOut,
              themeAnimationDuration: Duration(milliseconds: 300),
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              title: "Portfolio",
            ),
          );
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}
