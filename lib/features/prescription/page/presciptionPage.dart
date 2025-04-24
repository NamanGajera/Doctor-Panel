import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:flutter/material.dart';

class PresciptionPage extends StatefulWidget {
  const PresciptionPage({super.key});

  @override
  State<PresciptionPage> createState() => _PresciptionPageState();
}

class _PresciptionPageState extends State<PresciptionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText('Presciption'),
      ),
    );
  }
}
