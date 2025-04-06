import 'package:doctor_panel/core/constants/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _firstNameController,
                hintText: 'First Name',
                title: 'First Name', // Add title
                isRequired: true, // Show asterisk
                filled: true,
                inputFormatters: [NameInputFormatter()],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                controller: _middleNameController,
                hintText: 'Middle Name',
                title: 'Middle Name', // Add title
                isRequired: false, // Show asterisk
                filled: true,
                inputFormatters: [NameInputFormatter()],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                controller: _lastNameController,
                hintText: 'Last Name',
                title: 'Last Name', // Add title
                isRequired: true, // Show asterisk
                filled: true,
                inputFormatters: [NameInputFormatter()],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _mobileNumberController,
                hintText: 'Mobile Number',
                title: 'Mobile Number', // Add title
                isRequired: true, // Show asterisk
                filled: true,
                inputFormatters: [DigitsOnlyFormatter(maxLength: 10)],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                title: 'Email', // Add title
                isRequired: true, // Show asterisk
                filled: true,
                inputFormatters: [EmailInputFormatter()],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomDropdown<String>(
                items: const ['Male', 'Female', 'Other'],
                hintText: 'Select Gender',
                title: 'Gender',
                isRequired: true,
                value: 'Male',
                borderColor: primaryDarkBlueColor,
                onChanged: (value) {
                  // context.read<OnboardingBloc>().add(SelectGenderEvent(value));
                },
                enabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryDarkBlueColor,
                disabledBorderColor: Colors.transparent,
                fillColor: Colors.grey.shade300,
                filled: true,
                itemBuilder: (item) => CustomText(item),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _alternativeNumberController,
                hintText: 'Alternate Contact Number',
                title: 'Alternate Contact Number', // Add title
                isRequired: false, // Show asterisk
                filled: true,
                inputFormatters: [DigitsOnlyFormatter(maxLength: 10)],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                controller: _birthDateController,
                hintText: 'Birth Date',
                title: 'Birth Date', // Add title
                isRequired: true, // Show asterisk
                filled: true,
                readOnly: true,
                suffixIcon: Icons.date_range,
                suffixIconColor: Colors.grey,
                onTap: () {
                  CustomDatePicker.pick(
                    context: context,
                    mode: DatePickerModeEnum.date,
                  );
                },
                inputFormatters: [DigitsOnlyFormatter(maxLength: 10)],
                fillColor: Colors.grey.shade200,
                isBorderNone: false,
                borderColor: Colors.transparent,
                enabledBorderColor: Colors.transparent,
                disabledBorderColor: Colors.transparent,
                focusedBorderColor: primaryBlueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
