import 'dart:developer';

import 'package:doctor_panel/core/extension/bloc_event_call_extenstion.dart';
import 'package:doctor_panel/features/appointment/page/appointmentPage.dart';
import 'package:doctor_panel/features/auth/pages/auth_page.dart';
import 'package:doctor_panel/features/calendar/page/calendarPage.dart';
import 'package:doctor_panel/features/chat/page/chatPage.dart';
import 'package:doctor_panel/features/dashboard/page/dashboard_page.dart';
import 'package:doctor_panel/features/mainLayout/bloc/main_layout_bloc.dart';
import 'package:doctor_panel/features/mainLayout/page/main_layout.dart';
import 'package:doctor_panel/routers/route_names.dart';
import 'package:doctor_panel/routers/route_path.dart';
import 'package:doctor_panel/utils/page_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/helpSupport/page/helpSupportPage.dart';
import '../features/patient/page/patientPage.dart';
import '../features/prescription/page/presciptionPage.dart';
import '../features/profile/page/complete_profile_screen.dart';
import '../features/setting/page/settingPage.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: loginScreenPath,
  redirect: (context, state) {
    List<String> routeNames = [
      dashboardPagePath,
      appointmentPagePath,
      patientPagePath,
      calendarPagePath,
      chatPagePath,
      prescriptionPagePath,
      helpSupportPagePath,
      settingPagePath,
    ];
    final String currentRoutePath = state.matchedLocation;

    log('currentRoutePath $currentRoutePath');
    final index = routeNames.indexOf(currentRoutePath);
    log('index ==>> $index $currentRoutePath');
    if (index != -1) {
      final currentState = context.read<MainLayoutBloc>().state;
      if (currentState.selectedIndex != index) {
        context.addMainLayoutEvent(ChangeMenuEvent(selectedIndex: index));
      }
    }
    return null;
  },
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
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: dashboardPagePath,
          name: dashboardPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const DashboardPage());
          },
        ),
        GoRoute(
          path: appointmentPagePath,
          name: appointmentPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const Appointmentpage());
          },
        ),
        GoRoute(
          path: calendarPagePath,
          name: calendarPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const CalendarPage());
          },
        ),
        GoRoute(
          path: chatPagePath,
          name: chatPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const ChatPage());
          },
        ),
        GoRoute(
          path: helpSupportPagePath,
          name: helpSupportPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const HelpSupportPage());
          },
        ),
        GoRoute(
          path: patientPagePath,
          name: patientPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const PatientPage());
          },
        ),
        GoRoute(
          path: prescriptionPagePath,
          name: prescriptionPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const PresciptionPage());
          },
        ),
        GoRoute(
          path: settingPagePath,
          name: settingPageName,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const SettingPage());
          },
        ),
      ],
    ),
  ],
);
