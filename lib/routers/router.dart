import 'package:doctor_panel/features/auth/pages/auth_page.dart';
import 'package:doctor_panel/features/mainLayout/page/main_layout.dart';
import 'package:doctor_panel/routers/route_names.dart';
import 'package:doctor_panel/routers/route_path.dart';
import 'package:go_router/go_router.dart';

import '../features/profile/page/complete_profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: loginScreenPath,
  routes: [
    GoRoute(
      path: loginScreenPath,
      name: loginScreenName,
      builder: (context, state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      path: completeProfilePath,
      name: completeProfileName,
      builder: (context, state) {
        return const CompleteProfileScreen();
      },
    ),
    GoRoute(
      path: mainLayoutScreenPath,
      name: mainLayoutScreenName,
      builder: (context, state) {
        return const MainLayout();
      },
    ),
  ],
);
