import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/extension/layout_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/widgets.dart';

class ExperienceInfoForm extends StatefulWidget {
  const ExperienceInfoForm({super.key});

  @override
  State<ExperienceInfoForm> createState() => _ExperienceInfoFormState();
}

class _ExperienceInfoFormState extends State<ExperienceInfoForm> {
  // Current Professional Details controllers
  final TextEditingController _currentJobTitleController = TextEditingController();
  final TextEditingController _currentHospitalClinicNameController = TextEditingController();
  final TextEditingController _experienceYearsController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();

  // Previous Experience controllers
  final TextEditingController _previousJobTitleController = TextEditingController();
  final TextEditingController _previousHospitalClinicController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _responsibilitiesController = TextEditingController();

  // Certificate Upload related state
  List<String> certificates = [];
  bool isUploading = false;

  // Dropdown values
  String? _qualificationType;
  String? _registrationCouncil;

  // List for previous experiences
  List<Map<String, String>> previousExperiences = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Current Professional Details section
            _buildSectionContainer(
              icon: Icons.work,
              title: 'Current Professional Details',
              child: _buildCurrentProfessionalDetails(constraints.isWideScreen),
            ),

            const SizedBox(height: 24),

            // 2. Previous Experience section
            _buildSectionContainer(
              icon: Icons.history,
              title: 'Previous Experience',
              child: _buildPreviousExperienceSection(constraints.isWideScreen),
            ),

            const SizedBox(height: 24),

            // 3. Certificate Uploads section
            _buildSectionContainer(
              icon: Icons.upload_file,
              title: 'Certificate Uploads',
              child: _buildCertificateUploadsSection(constraints.isWideScreen),
            ),

            const SizedBox(height: 24),

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
                      _resetForm();
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
                      _saveForm();
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

  // Helper method to build section containers with consistent styling
  Widget _buildSectionContainer({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
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
              Icon(icon, color: primaryBlueColor),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  // 1. Current Professional Details section
  Widget _buildCurrentProfessionalDetails(bool isWideScreen) {
    return Column(
      children: [
        if (isWideScreen)
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _currentJobTitleController,
                  hintText: 'Enter current job title',
                  enabledBorderColor: Colors.grey.shade300,
                  focusedBorderColor: primaryBlueColor,
                  title: 'Current Job Title',
                  prefixIcon: Icons.work_outline,
                  prefixIconSize: 20,
                  prefixIconColor: primaryBlueColor,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  controller: _currentHospitalClinicNameController,
                  hintText: 'Enter current hospital/clinic name',
                  enabledBorderColor: Colors.grey.shade300,
                  focusedBorderColor: primaryBlueColor,
                  title: 'Current Hospital/Clinic Name',
                  prefixIcon: Icons.local_hospital,
                  prefixIconSize: 20,
                  prefixIconColor: primaryBlueColor,
                ),
              ),
            ],
          )
        else
          Column(
            children: [
              CustomTextField(
                controller: _currentJobTitleController,
                hintText: 'Enter current job title',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Current Job Title',
                prefixIcon: Icons.work_outline,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _currentHospitalClinicNameController,
                hintText: 'Enter current hospital/clinic name',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Current Hospital/Clinic Name',
                prefixIcon: Icons.local_hospital,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
              ),
            ],
          ),
        const SizedBox(height: 16),
        if (isWideScreen)
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _experienceYearsController,
                  hintText: 'Enter years of experience',
                  enabledBorderColor: Colors.grey.shade300,
                  focusedBorderColor: primaryBlueColor,
                  title: 'Years of Experience',
                  prefixIcon: Icons.access_time,
                  prefixIconSize: 20,
                  prefixIconColor: primaryBlueColor,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  controller: _specialtyController,
                  hintText: 'Enter medical specialty',
                  enabledBorderColor: Colors.grey.shade300,
                  focusedBorderColor: primaryBlueColor,
                  title: 'Specialty',
                  prefixIcon: Icons.star,
                  prefixIconSize: 20,
                  prefixIconColor: primaryBlueColor,
                ),
              ),
            ],
          )
        else
          Column(
            children: [
              CustomTextField(
                controller: _experienceYearsController,
                hintText: 'Enter years of experience',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Years of Experience',
                prefixIcon: Icons.access_time,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _specialtyController,
                hintText: 'Enter medical specialty',
                enabledBorderColor: Colors.grey.shade300,
                focusedBorderColor: primaryBlueColor,
                title: 'Specialty',
                prefixIcon: Icons.star,
                prefixIconSize: 20,
                prefixIconColor: primaryBlueColor,
              ),
            ],
          ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Qualification Type',
            prefixIcon: Icon(Icons.school, color: primaryBlueColor, size: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primaryBlueColor),
            ),
          ),
          value: _qualificationType,
          hint: const Text('Select qualification type'),
          onChanged: (value) {
            setState(() {
              _qualificationType = value;
            });
          },
          items: const [
            DropdownMenuItem(value: 'MBBS', child: Text('MBBS')),
            DropdownMenuItem(value: 'MD', child: Text('MD')),
            DropdownMenuItem(value: 'MS', child: Text('MS')),
            DropdownMenuItem(value: 'DM', child: Text('DM')),
            DropdownMenuItem(value: 'DNB', child: Text('DNB')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Registration Council',
            prefixIcon: Icon(Icons.account_balance, color: primaryBlueColor, size: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primaryBlueColor),
            ),
          ),
          value: _registrationCouncil,
          hint: const Text('Select registration council'),
          onChanged: (value) {
            setState(() {
              _registrationCouncil = value;
            });
          },
          items: const [
            DropdownMenuItem(value: 'MCI', child: Text('Medical Council of India (MCI)')),
            DropdownMenuItem(value: 'SMC', child: Text('State Medical Council (SMC)')),
            DropdownMenuItem(value: 'NMC', child: Text('National Medical Commission (NMC)')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
        ),
      ],
    );
  }

  // 2. Previous Experience section
  Widget _buildPreviousExperienceSection(bool isWideScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display existing previous experiences
        if (previousExperiences.isNotEmpty) ...[
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: previousExperiences.length,
            itemBuilder: (context, index) {
              final exp = previousExperiences[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exp['jobTitle'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                previousExperiences.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                      Text(exp['hospital'] ?? ''),
                      const SizedBox(height: 8),
                      Text(
                        '${exp['startDate']} - ${exp['endDate']}',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 8),
                      if (exp['responsibilities'] != null && exp['responsibilities']!.isNotEmpty)
                        Text(
                          'Responsibilities: ${exp['responsibilities']}',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(height: 32),
        ],

        // Form to add new experience
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Experience',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (isWideScreen)
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _previousJobTitleController,
                      hintText: 'Enter job title',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Job Title',
                      prefixIcon: Icons.work,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      controller: _previousHospitalClinicController,
                      hintText: 'Enter hospital/clinic name',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Hospital/Clinic Name',
                      prefixIcon: Icons.local_hospital,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  CustomTextField(
                    controller: _previousJobTitleController,
                    hintText: 'Enter job title',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Job Title',
                    prefixIcon: Icons.work,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _previousHospitalClinicController,
                    hintText: 'Enter hospital/clinic name',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Hospital/Clinic Name',
                    prefixIcon: Icons.local_hospital,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                  ),
                ],
              ),
            const SizedBox(height: 16),
            if (isWideScreen)
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _startDateController,
                      hintText: 'Select start date',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'Start Date',
                      prefixIcon: Icons.calendar_today,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            _startDateController.text = DateFormat('dd/MM/yyyy').format(picked);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      controller: _endDateController,
                      hintText: 'Select end date',
                      enabledBorderColor: Colors.grey.shade300,
                      focusedBorderColor: primaryBlueColor,
                      title: 'End Date',
                      prefixIcon: Icons.calendar_today,
                      prefixIconSize: 20,
                      prefixIconColor: primaryBlueColor,
                      readOnly: true,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            _endDateController.text = DateFormat('dd/MM/yyyy').format(picked);
                          });
                        }
                      },
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  CustomTextField(
                    controller: _startDateController,
                    hintText: 'Select start date',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'Start Date',
                    prefixIcon: Icons.calendar_today,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          _startDateController.text = DateFormat('dd/MM/yyyy').format(picked);
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _endDateController,
                    hintText: 'Select end date',
                    enabledBorderColor: Colors.grey.shade300,
                    focusedBorderColor: primaryBlueColor,
                    title: 'End Date',
                    prefixIcon: Icons.calendar_today,
                    prefixIconSize: 20,
                    prefixIconColor: primaryBlueColor,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          _endDateController.text = DateFormat('dd/MM/yyyy').format(picked);
                        });
                      }
                    },
                  ),
                ],
              ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _responsibilitiesController,
              hintText: 'Describe your key responsibilities',
              enabledBorderColor: Colors.grey.shade300,
              focusedBorderColor: primaryBlueColor,
              title: 'Key Responsibilities',
              prefixIcon: Icons.description,
              prefixIconSize: 20,
              prefixIconColor: primaryBlueColor,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: _addPreviousExperience,
                icon: const Icon(Icons.add),
                label: const Text('Add Experience'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: primaryBlueColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 3. Certificate Uploads section
  Widget _buildCertificateUploadsSection(bool isWideScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Instructions text
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info, color: primaryBlueColor, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Upload Requirements',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '• Please upload clear, high-quality scans of your original certificates',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '• Accepted formats: PDF, JPG, PNG (Max 5MB each)',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                '• Required documents: Medical degree, Registration certificate, Specialty certificates',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Certificate list
        if (certificates.isNotEmpty) ...[
          const Text(
            'Uploaded Certificates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.file_present),
                  title: Text(certificates[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        certificates.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],

        // Upload buttons
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isWideScreen ? 3 : 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isWideScreen ? 1 : 2.5,
          children: [
            _buildUploadCard(
              title: 'Medical Degree Certificate',
              icon: Icons.school,
              onUpload: () => _uploadCertificate('Medical Degree Certificate'),
            ),
            _buildUploadCard(
              title: 'Medical Registration Certificate',
              icon: Icons.card_membership,
              onUpload: () => _uploadCertificate('Medical Registration Certificate'),
            ),
            _buildUploadCard(
              title: 'Specialty/Additional Certificates',
              icon: Icons.assignment,
              onUpload: () => _uploadCertificate('Specialty Certificate'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadCard({
    required String title,
    required IconData icon,
    required VoidCallback onUpload,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onUpload,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: primaryBlueColor,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Click to upload',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Methods for actions
  void _addPreviousExperience() {
    if (_previousJobTitleController.text.isEmpty || _previousHospitalClinicController.text.isEmpty || _startDateController.text.isEmpty) {
      // Show validation error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      previousExperiences.add({
        'jobTitle': _previousJobTitleController.text,
        'hospital': _previousHospitalClinicController.text,
        'startDate': _startDateController.text,
        'endDate': _endDateController.text.isEmpty ? 'Present' : _endDateController.text,
        'responsibilities': _responsibilitiesController.text,
      });

      // Clear the controllers
      _previousJobTitleController.clear();
      _previousHospitalClinicController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _responsibilitiesController.clear();
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Experience added successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _uploadCertificate(String certificateType) {
    // Simulating file picker and upload
    setState(() {
      isUploading = true;
    });

    // After 1 second, add the certificate (simulating upload completion)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isUploading = false;
        certificates.add('$certificateType-${DateTime.now().millisecondsSinceEpoch}.pdf');
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$certificateType uploaded successfully'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void _resetForm() {
    setState(() {
      // Clear all controllers
      _currentJobTitleController.clear();
      _currentHospitalClinicNameController.clear();
      _experienceYearsController.clear();
      _specialtyController.clear();
      _previousJobTitleController.clear();
      _previousHospitalClinicController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _responsibilitiesController.clear();

      // Reset dropdowns
      _qualificationType = null;
      _registrationCouncil = null;

      // Clear lists
      previousExperiences.clear();
      certificates.clear();
    });

    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form has been reset'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _saveForm() {
    // Validation
    if (_currentJobTitleController.text.isEmpty ||
        _currentHospitalClinicNameController.text.isEmpty ||
        _experienceYearsController.text.isEmpty ||
        _qualificationType == null ||
        _registrationCouncil == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields in Current Professional Details'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (certificates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload at least one certificate'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // If all validations pass, show success and handle form submission
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Experience information saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Here you would typically send the data to your backend
    // For example:
    _submitDataToBackend();

    // Navigate to the next step in registration if needed
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextRegistrationStep()));
  }

  void _submitDataToBackend() {
    // Create the data model to send to your backend
    final Map<String, dynamic> experienceData = {
      'currentProfessionalDetails': {
        'jobTitle': _currentJobTitleController.text,
        'hospitalClinicName': _currentHospitalClinicNameController.text,
        'yearsOfExperience': _experienceYearsController.text,
        'specialty': _specialtyController.text,
        'qualificationType': _qualificationType,
        'registrationCouncil': _registrationCouncil,
      },
      'previousExperiences': previousExperiences,
      'certificates': certificates,
    };

    // Here you would typically make an API call to your backend
    // For example:
    // final response = await http.post(
    //   Uri.parse('https://your-api.com/doctor/experience'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(experienceData),
    // );

    print('Experience data ready to submit: $experienceData');
    // For now, we're just printing the data to the console
  }

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    _currentJobTitleController.dispose();
    _currentHospitalClinicNameController.dispose();
    _experienceYearsController.dispose();
    _specialtyController.dispose();
    _previousJobTitleController.dispose();
    _previousHospitalClinicController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _responsibilitiesController.dispose();
    super.dispose();
  }
}
