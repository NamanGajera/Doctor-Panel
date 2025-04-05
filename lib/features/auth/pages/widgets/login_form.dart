import 'package:doctor_panel/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/constants/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                        padding: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state.isLoginPage ? Colors.black : Colors.white,
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
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(ToggleLoginAndSignUpPageEvent(isLoginPage: false));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
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
              CustomText.headlineMedium(
                'Journey Begins',
                fontSize: 20,
              ),
              CustomText.labelSmall(
                'Sign in with these providers',
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  _socialLoginButton(Icons.apple, Colors.black),
                  const SizedBox(width: 10),
                  _socialLoginButton(Icons.g_mobiledata, Colors.redAccent),
                  const SizedBox(width: 10),
                  _socialLoginButton(Icons.close, Colors.blue),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomText.labelSmall('or', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                customDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryBlueColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                customDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: 'Password',
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryBlueColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: CustomText.labelMedium(
                      'Forgot Password?',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Login',
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.white,
                width: double.infinity,
                borderRadius: 5,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _socialLoginButton(IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: screenHeight * 0.045,
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlueColor.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
