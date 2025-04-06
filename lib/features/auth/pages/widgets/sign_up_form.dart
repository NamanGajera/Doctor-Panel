import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.headlineMedium(
          'Journey Begins',
          fontSize: 20,
        ),
        CustomText.labelSmall(
          'Sign Up with these providers',
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
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText.labelSmall('or', style: const TextStyle(color: Colors.grey)),
            ),
            const Expanded(child: Divider()),
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
              borderSide: const BorderSide(color: primaryBlueColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
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
              borderSide: const BorderSide(color: primaryBlueColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          controller: _confirmPasswordController,
          hintText: 'Confirm Password',
          customDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: InputBorder.none,
            hintText: 'Confirm Password',
            suffixIcon: const Icon(
              Icons.remove_red_eye_sharp,
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryBlueColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
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
          label: 'Sign Up',
          onPressed: () {},
          color: Colors.black,
          textColor: Colors.white,
          width: double.infinity,
          borderRadius: 5,
        ),
      ],
    );
  }

  Widget _socialLoginButton(IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: context.screenHeight * 0.045,
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
