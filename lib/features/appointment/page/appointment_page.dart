import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';

import 'widgets/appointment_data_table.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

class _AppointmentpageState extends State<Appointmentpage> {
  int _currentTabIndex = 0;

  // Sample data for tab counts - you would get this from your actual data
  final List<String> _tabs = [
    'All Appointments (200)',
    'Approved',
    'Cancelled',
    'Pending'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabs: _tabs,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          initialIndex: _currentTabIndex,
          onTabSelected: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          selectedTabColor: primaryDarkBlueColor,
          backgroundColor: Colors.grey.shade200,
          borderRadius: 8.0,
          height: 30.0,
        ),
        const SizedBox(height: 20),
        const AppointmentDataTable(),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 15, vertical: 6));
  }
}
