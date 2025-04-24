import 'package:flutter/material.dart';

import '../../../core/constants/widgets.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText('Patient'),
      ),
    );
  }
}
