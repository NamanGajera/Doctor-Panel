import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:doctor_panel/features/auth/bloc/auth_bloc.dart';
import 'package:doctor_panel/features/auth/pages/widgets/image_section.dart';
import 'package:doctor_panel/features/auth/pages/widgets/login_form.dart';
import 'package:doctor_panel/features/auth/pages/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = context.screenWidth > 900;
    final bool isMediumScreen = context.screenWidth > 600 && context.screenWidth <= 900;

    return Scaffold(
      backgroundColor: const Color(0xff0A4D68), // Teal background color as shown in your image
      body: Center(
        child: Container(
          width: isWideScreen ? context.screenWidth * 0.85 : (isMediumScreen ? context.screenWidth * 0.9 : context.screenWidth * 0.95),
          height: isWideScreen ? context.screenHeight * 0.95 : null,
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
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: _authPage(context),
        ),
        const Expanded(
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

  Widget _authPage(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomText.headlineMedium('Doctor House'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(ToggleLoginAndSignUpPageEvent(isLoginPage: true));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state.isLoginPage ? Colors.black : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CustomText.bodyLarge(
                          'Login',
                          fontSize: 16,
                          color: state.isLoginPage ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(ToggleLoginAndSignUpPageEvent(isLoginPage: false));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state.isLoginPage ? Colors.white : Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CustomText.bodyLarge(
                          'Sign Up',
                          fontSize: 16,
                          color: state.isLoginPage ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              state.isLoginPage ? const LoginForm() : const SignUpForm(),
            ],
          ),
        );
      },
    ).withPadding(const EdgeInsets.symmetric(horizontal: 140, vertical: 20));
  }
}
