import 'dart:developer';

import 'package:doctor_panel/core/extension/bloc_event_call_extenstion.dart';
import 'package:doctor_panel/features/appointment/page/appointment_page.dart';
import 'package:doctor_panel/features/auth/pages/auth_page.dart';
import 'package:doctor_panel/features/calendar/page/calendarPage.dart';
import 'package:doctor_panel/features/chat/page/chatPage.dart';
import 'package:doctor_panel/features/dashboard/page/dashboard_page.dart';
import 'package:doctor_panel/features/mainLayout/bloc/main_layout_bloc.dart';
import 'package:doctor_panel/features/mainLayout/page/main_layout.dart';
import 'package:doctor_panel/routers/route_name_and_path.dart';
import 'package:doctor_panel/utils/page_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/helpSupport/page/helpSupportPage.dart';
import '../features/patient/page/patientPage.dart';
import '../features/prescription/page/presciptionPage.dart';
import '../features/profile/page/complete_profile_screen.dart';
import '../features/setting/page/settingPage.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouterName.login.path,
  redirect: (context, state) {
    List<String> routeNames = [
      RouterName.dashboardPage.path,
      RouterName.appointmentPage.path,
      RouterName.patientPage.path,
      RouterName.calendarPage.path,
      RouterName.chatPage.path,
      RouterName.prescriptionPage.path,
      RouterName.helpSupportPage.path,
      RouterName.settingPage.path,
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
      path: RouterName.login.path,
      name: RouterName.login.name,
      builder: (context, state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      path: RouterName.completeProfile.path,
      name: RouterName.completeProfile.name,
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
          path: RouterName.dashboardPage.path,
          name: RouterName.dashboardPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const DashboardPage());
          },
        ),
        GoRoute(
          path: RouterName.appointmentPage.path,
          name: RouterName.appointmentPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const Appointmentpage());
          },
        ),
        GoRoute(
          path: RouterName.calendarPage.path,
          name: RouterName.calendarPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const CalendarPage());
          },
        ),
        GoRoute(
          path: RouterName.chatPage.path,
          name: RouterName.chatPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const ChatPage());
          },
        ),
        GoRoute(
          path: RouterName.helpSupportPage.path,
          name: RouterName.helpSupportPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const HelpSupportPage());
          },
        ),
        GoRoute(
          path: RouterName.patientPage.path,
          name: RouterName.patientPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const PatientPage());
          },
        ),
        GoRoute(
          path: RouterName.prescriptionPage.path,
          name: RouterName.prescriptionPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const PresciptionPage());
          },
        ),
        GoRoute(
          path: RouterName.settingPage.path,
          name: RouterName.settingPage.name,
          pageBuilder: (context, state) {
            return FadeTransitionPage(child: const SettingPage());
          },
        ),
      ],
    ),
  ],
);
