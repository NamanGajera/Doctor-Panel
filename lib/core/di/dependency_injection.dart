import 'package:doctor_panel/features/auth/bloc/auth_bloc.dart';
import 'package:doctor_panel/features/profile/bloc/profile_screen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerFactory<AuthBloc>(() => AuthBloc());
  getIt.registerFactory<ProfileScreenBloc>(() => ProfileScreenBloc());
}
