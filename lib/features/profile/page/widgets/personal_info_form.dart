import 'dart:io';

import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/extension/layout_extension.dart';
import 'package:doctor_panel/utils/enums.dart';
import 'package:doctor_panel/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/widgets.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alternativeNumberController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  File? _profileImage;
  bool get hasProfileImage => _profileImage != null;
  String _selectedGender = 'Male';

  void _pickImage() async {
    // Image picking implementation to be added
    // The actual implementation would depend on web-specific packages
  }

  void _calculateAge() {
    if (_birthDateController.text.isNotEmpty) {
      try {
        final birthDate = DateTime.parse(_birthDateController.text);
        final today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }
        _ageController.text = age.toString();
      } catch (e) {
        // Handle parsing error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: constraints.isWideScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfilePhotoSection(),
                        const SizedBox(width: 40),
                        Expanded(child: _buildNameFields()),
                      ],
                    )
                  : Column(
                      children: [
                        _buildProfilePhotoSection(),
                        const SizedBox(height: 30),
                        _buildNameFields(),
                      ],
                    ),
            ),

            const SizedBox(height: 24),

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
                        'Personal Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Date of birth and Age row
                  _buildPersonalDetailsFields(constraints.isWideScreen),
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
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildContactFields(constraints.isWideScreen),
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

  Widget _buildProfilePhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.grey.shade100, Colors.grey.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: primaryBlueColor.withOpacity(0.3),
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Profile Image or Placeholder
              hasProfileImage
                  ? ClipOval(
                      child: Image.file(
                        _profileImage!,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),

              // Camera Button Overlay
              Positioned(
                bottom: 0,
                right: 10,
                child: Material(
                  elevation: 4,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  color: primaryBlueColor,
                  child: InkWell(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [primaryBlueColor, primaryDarkBlueColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.cloud_upload, color: primaryBlueColor, size: 20),
          label: Text(
            'Upload Photo',
            style: TextStyle(
              color: primaryBlueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildNameFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.badge, color: primaryBlueColor),
            const SizedBox(width: 10),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _firstNameController,
          hintText: 'Enter your first name',
          enabledBorderColor: Colors.grey.shade300,
          focusedBorderColor: primaryBlueColor,
          title: 'First Name',
          isRequired: true,
          prefixIcon: Icons.person_outline,
          prefixIconSize: 20,
          prefixIconColor: primaryBlueColor,
          inputFormatters: [NameInputFormatter()],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _middleNameController,
          hintText: 'Enter your middle name (optional)',
          enabledBorderColor: Colors.grey.shade300,
          focusedBorderColor: primaryBlueColor,
          title: 'Middle Name',
          isRequired: true,
          prefixIcon: Icons.person_outline,
          prefixIconSize: 20,
          prefixIconColor: primaryBlueColor,
          inputFormatters: [NameInputFormatter()],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _lastNameController,
          hintText: 'Enter your last name',
          enabledBorderColor: Colors.grey.shade300,
          focusedBorderColor: primaryBlueColor,
          title: 'Last Name',
          isRequired: true,
          prefixIcon: Icons.person_outline,
          prefixIconSize: 20,
          prefixIconColor: primaryBlueColor,
          inputFormatters: [NameInputFormatter()],
        ),
      ],
    );
  }

  Widget _buildPersonalDetailsFields(bool isWideScreen) {
    return Column(
      children: [
        isWideScreen
            ? Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _birthDateController,
                      hintText: 'YYYY-MM-DD',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Date of Birth',
                      isRequired: true,
                      prefixIcon: Icons.calendar_today,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                      readOnly: true,
                      onTap: () async {
                        final result = await CustomDatePicker.pick(
                          context: context,
                          mode: DatePickerModeEnum.date,
                          initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
                          firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
                          lastDate: DateTime.now(),
                        );
                        if (result != null) {
                          setState(() {
                            _birthDateController.text = result.toString().split(' ')[0];
                            _calculateAge();
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      controller: _ageController,
                      hintText: 'Age',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Age',
                      prefixIcon: Icons.access_time,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomDropdown(
                    hintText: 'Gender',
                    value: _selectedGender,
                    prefixIcon: _selectedGender == "Male"
                        ? Icons.male
                        : _selectedGender == "Female"
                            ? Icons.female
                            : Icons.person,
                    items: ['Male', 'Female', 'Other'],
                    itemBuilder: (item) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              item == "Male"
                                  ? Icons.male
                                  : item == "Female"
                                      ? Icons.female
                                      : Icons.person,
                              color: primaryBlueColor,
                              size: 20,
                            ),
                          ),
                          CustomText(
                            item,
                          ),
                        ],
                      );
                    },
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value ?? 'Male';
                      });
                    },
                    title: 'Gender',
                    disabledBorderColor: Colors.grey,
                    focusedBorderColor: primaryBlueColor,
                    borderColor: Colors.grey,
                    enabledBorderColor: Colors.grey,
                  )),
                ],
              )
            : Column(
                children: [
                  CustomTextField(
                    controller: _birthDateController,
                    hintText: 'YYYY-MM-DD',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Date of Birth',
                    isRequired: true,
                    prefixIcon: Icons.calendar_today,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                    readOnly: true,
                    onTap: () async {
                      final result = await CustomDatePicker.pick(
                        context: context,
                        mode: DatePickerModeEnum.date,
                        initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
                        firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
                        lastDate: DateTime.now(),
                      );
                      if (result != null) {
                        setState(() {
                          _birthDateController.text = result.toString().split(' ')[0];
                          _calculateAge();
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _ageController,
                    hintText: 'Age',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Age',
                    prefixIcon: Icons.access_time,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                    readOnly: true,
                  ),
                  const SizedBox(height: 16),
                  CustomDropdown(
                    hintText: 'Gender',
                    value: _selectedGender,
                    prefixIcon: _selectedGender == "Male"
                        ? Icons.male
                        : _selectedGender == "Female"
                            ? Icons.female
                            : Icons.person,
                    items: ['Male', 'Female', 'Other'],
                    itemBuilder: (item) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              item == "Male"
                                  ? Icons.male
                                  : item == "Female"
                                      ? Icons.female
                                      : Icons.person,
                              color: primaryBlueColor,
                              size: 20,
                            ),
                          ),
                          CustomText(
                            item,
                          ),
                        ],
                      );
                    },
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value ?? 'Male';
                      });
                    },
                    title: 'Gender',
                    disabledBorderColor: Colors.grey,
                    focusedBorderColor: primaryBlueColor,
                    borderColor: Colors.grey,
                    enabledBorderColor: Colors.grey,
                  )
                ],
              ),
      ],
    );
  }

  Widget _buildContactFields(bool isWideScreen) {
    return Column(
      children: [
        isWideScreen
            ? Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _mobileNumberController,
                      hintText: 'Enter your mobile number',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Mobile Number',
                      prefixIcon: Icons.phone_android,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      controller: _alternativeNumberController,
                      hintText: 'Enter alternative contact (optional)',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Enter alternative contact (optional)',
                      prefixIcon: Icons.phone_android,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  CustomTextField(
                    controller: _mobileNumberController,
                    hintText: 'Enter your mobile number',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Mobile Number',
                    prefixIcon: Icons.phone_android,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _alternativeNumberController,
                    hintText: 'Enter alternative contact (optional)',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Enter alternative contact (optional)',
                    prefixIcon: Icons.phone_android,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                  ),
                ],
              ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _emailController,
          hintText: 'Enter your email address',
          enabledBorderColor: Colors.grey.shade300,
          focusedBorderColor: primaryBlueColor,
          title: 'Email Address',
          prefixIcon: Icons.phone_android,
          prefixIconSize: 20,
          prefixIconColor: primaryBlueColor,
          inputFormatters: [EmailInputFormatter()],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _alternativeNumberController.dispose();
    _birthDateController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
