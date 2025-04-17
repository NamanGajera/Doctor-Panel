import 'package:doctor_panel/features/auth/bloc/auth_bloc.dart';
import 'package:doctor_panel/features/mainLayout/bloc/main_layout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/di/dependency_injection.dart';
import 'core/services/shared_prefs_helper.dart';
import 'core/theme/app_theme.dart';
import 'features/profile/bloc/profile_screen_bloc.dart';
import 'routers/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  await setupDependencies();
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
            BlocProvider(create: (context) => ProfileScreenBloc()),
            BlocProvider(create: (context) => MainLayoutBloc()),
          ],
          child: MaterialApp.router(
            title: 'Doctor House',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: appRouter,
          ),
        ),
      ),
    );
  }
}
