import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:flutter/material.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

class _AppointmentpageState extends State<Appointmentpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText('Appointment'),
      ),
    );
  }
}
