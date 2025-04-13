import 'dart:io';

import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/extension/layout_extension.dart';
import 'package:doctor_panel/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/widgets.dart';

class EducationInfoForm extends StatefulWidget {
  const EducationInfoForm({super.key});

  @override
  State<EducationInfoForm> createState() => _EducationInfoFormState();
}

class _EducationInfoFormState extends State<EducationInfoForm> {
  final TextEditingController _highestQualificationController = TextEditingController();
  final TextEditingController _universityCollegeNameController = TextEditingController();
  final TextEditingController _yearCompletionController = TextEditingController();
  final TextEditingController _medicalCouncilRegistrationNoController = TextEditingController();

  File? _profileImage;
  bool get hasProfileImage => _profileImage != null;
  String? _specialization;
  String? _qualificationType;
  String? _registrationCouncil;

  List<String> registrationCouncilList = [
    'MCI',
    'State Medical Council',
  ];

  List<String> specializationList = [
    'Dentist',
    'Cardiologist',
    'Orthopedic',
  ];
  List<String> qualificationTypeList = [
    'Undergraduate',
    'Postgraduate',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal details section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: primaryBlueColor),
                      const SizedBox(width: 10),
                      const Text(
                        'Basic Qualification',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Date of birth and Age row
                  _buildBasicQualificationDetails(constraints.isWideScreen),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Contact information section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.contact_phone, color: primaryBlueColor),
                      const SizedBox(width: 10),
                      const Text(
                        'Medical Council Registration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildMedicalCouncilRegistrationDetails(constraints.isWideScreen),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel Button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      // Reset form
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: primaryBlueColor),
                      foregroundColor: primaryBlueColor,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Save Button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: primaryBlueColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Save form
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      backgroundColor: primaryBlueColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Save & Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBasicQualificationDetails(bool isWideScreen) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _highestQualificationController,
                hintText: 'Enter highest qualification',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Highest qualification',
                prefixIcon: Icons.book,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: CustomDropdown(
              hintText: 'Specialization',
              value: _specialization,
              prefixIcon: Icons.book_sharp,
              prefixIconColor: primaryBlueColor,
              prefixIconSize: 20,
              items: specializationList,
              itemBuilder: (item) {
                return CustomText(item);
              },
              isRequired: true,
              onChanged: (value) {
                setState(() {
                  _specialization = value ?? '';
                });
              },
              title: 'Specialization',
              disabledBorderColor: Colors.grey,
              focusedBorderColor: primaryBlueColor,
              borderColor: Colors.grey,
              enabledBorderColor: Colors.grey,
            )),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _universityCollegeNameController,
                hintText: 'Enter university / college name',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'University / College Name',
                prefixIcon: Icons.school,
                prefixIconSize: 20,
                isRequired: true,
                prefixIconColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomDropdown(
                hintText: 'Qualification Type',
                value: _qualificationType,
                prefixIcon: Icons.book_sharp,
                prefixIconColor: primaryBlueColor,
                prefixIconSize: 20,
                items: qualificationTypeList,
                itemBuilder: (item) {
                  return CustomText(item);
                },
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _qualificationType = value ?? '';
                  });
                },
                title: 'Qualification Type',
                disabledBorderColor: Colors.grey,
                focusedBorderColor: primaryBlueColor,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomTextField(
                controller: _yearCompletionController,
                hintText: 'Year of Completion',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Year of Completion',
                prefixIcon: Icons.school,
                prefixIconSize: 20,
                isRequired: true,
                prefixIconColor: primaryBlueColor,
                inputFormatters: [DigitsOnlyFormatter()],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildMedicalCouncilRegistrationDetails(bool isWideScreen) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _medicalCouncilRegistrationNoController,
                hintText: 'Enter medical council registration no',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Medical Council Registration No',
                prefixIcon: Icons.book,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: CustomDropdown(
              hintText: 'Registration council',
              value: _registrationCouncil,
              prefixIcon: Icons.book_sharp,
              prefixIconColor: primaryBlueColor,
              prefixIconSize: 20,
              items: registrationCouncilList,
              itemBuilder: (item) {
                return CustomText(item);
              },
              onChanged: (value) {
                setState(() {
                  _registrationCouncil = value ?? '';
                });
              },
              title: 'Registration Council',
              disabledBorderColor: Colors.grey,
              focusedBorderColor: primaryBlueColor,
              borderColor: Colors.grey,
              enabledBorderColor: Colors.grey,
            )),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _highestQualificationController.dispose();
    _universityCollegeNameController.dispose();
    _yearCompletionController.dispose();
    _medicalCouncilRegistrationNoController.dispose();
    super.dispose();
  }
}
