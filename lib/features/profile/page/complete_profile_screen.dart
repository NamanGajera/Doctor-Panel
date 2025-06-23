import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/features/profile/bloc/profile_screen_bloc.dart';
import 'package:doctor_panel/features/profile/page/widgets/education_info_form.dart';
import 'package:doctor_panel/features/profile/page/widgets/experience_info_form.dart';
import 'package:doctor_panel/features/profile/page/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _steps = [
    {
      'title': 'Personal Info',
      'icon': Icons.person_outlined,
      'form': const PersonalInfoForm(),
    },
    {
      'title': 'Education',
      'icon': Icons.school_outlined,
      'form': const EducationInfoForm(),
    },
    {
      'title': 'Experience',
      'icon': Icons.work_outline_outlined,
      'form': const ExperienceInfoForm(),
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Doctor Profile Setup',
              style: TextStyle(
                color: primaryDarkBlueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: primaryDarkBlueColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
            listener: (context, state) {
              _pageController.animateToPage(
                state.stepIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            builder: (context, state) {
              return Column(
                children: [
                  // Side tabs for desktop view, top tabs for mobile
                  if (isDesktop)
                    _buildDesktopLayout(state, context)
                  else
                    _buildMobileLayout(state, context),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(ProfileScreenState state, BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          // Side navigation
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 32),
                _buildProgressIndicator(state),
                const SizedBox(height: 32),
                ..._buildSideNavItems(state, context),
                const Spacer(),
                _buildDesktopNavButtons(state, context),
              ],
            ),
          ),
          // Content area
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _steps
                  .map((step) => _buildDesktopFormContainer(step['form']))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(ProfileScreenState state, BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildMobileStepIndicator(state),
          _buildProgressIndicator(state),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _steps
                  .map((step) => _buildMobileFormContainer(step['form']))
                  .toList(),
            ),
          ),
          _buildMobileNavButtons(state, context),
        ],
      ),
    );
  }

  Widget _buildMobileStepIndicator(ProfileScreenState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_steps.length, (index) {
          final bool isActive = index == state.stepIndex;
          final bool isCompleted = index < state.stepIndex;

          return Row(
            children: [
              if (index > 0)
                Container(
                  width: 20,
                  height: 1,
                  color: isCompleted ? primaryDarkBlueColor : Colors.grey[300],
                ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? primaryDarkBlueColor
                      : (isCompleted ? Colors.green : Colors.grey[300]),
                ),
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  isCompleted ? Icons.check : _steps[index]['icon'],
                  size: 16,
                  color: Colors.white,
                ),
              ),
              if (index < _steps.length - 1)
                Container(
                  width: 20,
                  height: 1,
                  color: isCompleted ? primaryDarkBlueColor : Colors.grey[300],
                ),
            ],
          );
        }),
      ),
    );
  }

  List<Widget> _buildSideNavItems(
      ProfileScreenState state, BuildContext context) {
    return List.generate(_steps.length, (index) {
      final bool isActive = index == state.stepIndex;
      final bool isCompleted = index < state.stepIndex;

      return InkWell(
        onTap: () {
          if (index <= state.stepIndex || index == state.stepIndex + 1) {
            context
                .read<ProfileScreenBloc>()
                .add(ChangeStepperEvent(index: index));
          } else {
            _showStepWarning(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
            color: isActive
                ? primaryDarkBlueColor.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isActive
                ? Border.all(color: primaryDarkBlueColor, width: 1)
                : null,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? primaryDarkBlueColor
                      : (isCompleted ? Colors.green : Colors.grey[300]),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  isCompleted ? Icons.check : _steps[index]['icon'],
                  size: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _steps[index]['title'],
                      style: TextStyle(
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? primaryDarkBlueColor : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    if (isActive)
                      Text(
                        'Step ${index + 1} of ${_steps.length}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              if (isCompleted)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 18,
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildProgressIndicator(ProfileScreenState state) {
    final double progress = (state.stepIndex + 1) / _steps.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _steps[state.stepIndex]['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 6,
                width: MediaQuery.of(context).size.width * progress - 48,
                decoration: BoxDecoration(
                  color: progress == 1.0 ? Colors.green : primaryDarkBlueColor,
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    colors: [
                      primaryDarkBlueColor,
                      progress == 1.0
                          ? Colors.green
                          : primaryDarkBlueColor.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFormContainer(Widget form) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: form,
      ),
    );
  }

  Widget _buildMobileFormContainer(Widget form) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        child: form,
      ),
    );
  }

  Widget _buildDesktopNavButtons(
      ProfileScreenState state, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (state.stepIndex > 0)
            OutlinedButton.icon(
              onPressed: () {
                context.read<ProfileScreenBloc>().add(
                      ChangeStepperEvent(index: state.stepIndex - 1),
                    );
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                side: const BorderSide(color: primaryDarkBlueColor),
                foregroundColor: primaryDarkBlueColor,
              ),
            )
          else
            const SizedBox(),
          ElevatedButton.icon(
            onPressed: () {
              if (state.stepIndex < _steps.length - 1) {
                context.read<ProfileScreenBloc>().add(
                      ChangeStepperEvent(index: state.stepIndex + 1),
                    );
              } else {
                _showCompletionDialog(context);
              }
            },
            icon: Icon(state.stepIndex < _steps.length - 1
                ? Icons.arrow_forward
                : Icons.check),
            label: Text(state.stepIndex < _steps.length - 1
                ? 'Continue'
                : 'Submit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: state.stepIndex < _steps.length - 1
                  ? primaryDarkBlueColor
                  : Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavButtons(
      ProfileScreenState state, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (state.stepIndex > 0)
            TextButton.icon(
              onPressed: () {
                context.read<ProfileScreenBloc>().add(
                      ChangeStepperEvent(index: state.stepIndex - 1),
                    );
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              style: TextButton.styleFrom(
                foregroundColor: primaryDarkBlueColor,
              ),
            )
          else
            const SizedBox(),
          ElevatedButton(
            onPressed: () {
              if (state.stepIndex < _steps.length - 1) {
                context.read<ProfileScreenBloc>().add(
                      ChangeStepperEvent(index: state.stepIndex + 1),
                    );
              } else {
                _showCompletionDialog(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: state.stepIndex < _steps.length - 1
                  ? primaryDarkBlueColor
                  : Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              state.stepIndex < _steps.length - 1 ? 'Continue' : 'Complete',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void _showStepWarning(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please complete the current step first'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 64,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Profile Completed!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your doctor profile has been submitted successfully. Our team will review it shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to dashboard or home
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryDarkBlueColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Go to Dashboard'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
