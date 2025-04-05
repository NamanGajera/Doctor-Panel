import 'package:doctor_panel/features/auth/pages/login_page.dart';
import 'package:doctor_panel/routers/route_names.dart';
import 'package:doctor_panel/routers/route_path.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: loginScreenPath,
  routes: [
    GoRoute(
      path: loginScreenPath,
      name: loginScreenName,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
);
