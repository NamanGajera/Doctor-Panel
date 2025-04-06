import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:doctor_panel/features/profile/bloc/profile_screen_bloc.dart';
import 'package:doctor_panel/features/profile/page/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final List<String> _stepTitles = ['Personal Info', 'Education', 'Experience', 'Review'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: primaryDarkBlueColor,
      ),
      body: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildCustomStepper(context, state),
              const SizedBox(height: 20),
              _buildStepTitle(state),
              const SizedBox(height: 24),
              const Expanded(
                child: PersonalInfoForm(),
              ),
            ],
          );
        },
      ).withPadding(const EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
    );
  }

  Widget _buildCustomStepper(BuildContext context, ProfileScreenState state) {
    return Row(
      children: List.generate(4, (index) {
        // Creating step indicator
        return Expanded(
          child: Row(
            children: [
              if (index > 0)
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 3,
                    decoration: BoxDecoration(
                      color: state.stepIndex >= index ? Colors.green : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  // Only allow going to steps that are already completed or the next step
                  if (index <= state.stepIndex || index == state.stepIndex + 1) {
                    context.read<ProfileScreenBloc>().add(ChangeStepperEvent(index: index));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete previous steps first'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _getStepColor(state.stepIndex, index),
                    shape: BoxShape.circle,
                    boxShadow: [
                      if (state.stepIndex == index)
                        BoxShadow(
                          color: primaryDarkBlueColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: state.stepIndex > index
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                      : CustomText.labelLarge(
                          '${index + 1}',
                          color: Colors.white,
                        ),
                ),
              ),
              if (index < 3)
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 3,
                    decoration: BoxDecoration(
                      color: state.stepIndex > index ? Colors.green : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Color _getStepColor(int currentStep, int stepIndex) {
    if (currentStep > stepIndex) {
      return Colors.green; // Completed step
    } else if (currentStep == stepIndex) {
      return primaryDarkBlueColor; // Current step
    } else {
      return Colors.grey.shade400; // Future step
    }
  }

  Widget _buildStepTitle(ProfileScreenState state) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: CustomText.headlineSmall(
        _stepTitles[state.stepIndex],
        key: ValueKey<int>(state.stepIndex),
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
        color: primaryDarkBlueColor,
      ),
    );
  }
}
