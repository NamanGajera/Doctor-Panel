import 'package:doctor_panel/core/constants/size.dart';
import 'package:doctor_panel/features/auth/pages/widgets/image_section.dart';
import 'package:doctor_panel/features/auth/pages/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = screenWidth > 900;
    final bool isMediumScreen = screenWidth > 600 && screenWidth <= 900;

    return Scaffold(
      backgroundColor: const Color(0xff0A4D68), // Teal background color as shown in your image
      body: Center(
        child: Container(
          width: isWideScreen ? screenWidth * 0.85 : (isMediumScreen ? screenWidth * 0.9 : screenWidth * 0.95),
          height: isWideScreen ? screenHeight * 0.9 : null,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: isWideScreen ? _buildWideLayout(context) : _buildNarrowLayout(context),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 7,
          child: LoginForm(),
        ),
        Expanded(
          flex: 5,
          child: ImageSection(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LoginForm(),
          SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ImageSection(),
          ),
        ],
      ),
    );
  }
}
