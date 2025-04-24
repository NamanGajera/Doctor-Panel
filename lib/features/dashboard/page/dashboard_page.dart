import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:doctor_panel/features/dashboard/page/widget/appointment_card.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(
                  child: AppointmentCard(
                    title: 'Total Appointments',
                    subtitle: 'Includes confirmed & pending',
                    value: '42',
                    iconPath: AppIcons.personIcon,
                    iconBackgroundColor: Colors.white,
                    cardColor: Color(0xFFECEAFF),
                    trendValue: '+8% vs last week',
                    trendPositive: true,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AppointmentCard(
                    title: 'Upcoming Today',
                    subtitle: 'Next: Sarah Johnson at 10:30',
                    value: '12',
                    iconPath: AppIcons.calendarIcon,
                    iconBackgroundColor: Colors.white,
                    cardColor: Color(0xFFE6F7FF),
                    showMoreButton: true,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AppointmentCard(
                    title: 'Pending Approvals',
                    subtitle: 'Requires your confirmation',
                    value: '7',
                    iconPath: AppIcons.clockIcon,
                    iconBackgroundColor: Colors.white,
                    cardColor: Color(0xFFFFF4E6),
                    showMoreButton: true,
                    urgent: true,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AppointmentCard(
                    title: 'Completed Sessions',
                    subtitle: 'This week\'s consultations',
                    value: '23',
                    iconPath: AppIcons.checkMarkIcon,
                    iconBackgroundColor: Colors.white,
                    cardColor: Color(0xFFd6e4e5),
                    trendValue: '+15% vs last week',
                    trendPositive: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Header Row
                  Container(
                    decoration: BoxDecoration(
                      color: logoBlueColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Expanded(flex: 2, child: Center(child: CustomText(''))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Patient Name')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Date')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 3,
                            child: const CustomText('Time')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 5,
                            child: const CustomText('Treatment')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Appointment')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Payment')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Duration')
                                .withPadding(const EdgeInsets.only(left: 8))),
                        _rowVerticalDivider(),
                        Expanded(
                            flex: 4,
                            child: const CustomText('Attachment')
                                .withPadding(const EdgeInsets.only(left: 8))),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Example List (can be dynamic using ListView.builder)
                  ...List.generate(10, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child:
                                Checkbox(value: false, onChanged: (value) {}),
                          ),
                          Expanded(
                            flex: 4,
                            child: const CustomText('John Doe')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 4,
                            child: const CustomText('19 Apr 2025')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 3,
                            child: const CustomText('10:30 AM')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 5,
                            child: const CustomText('Root Canal')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 4,
                            child: const CustomText('Confirmed')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 4,
                            child: const CustomText('Paid')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          Expanded(
                            flex: 4,
                            child: const CustomText('30 mins')
                                .withPadding(const EdgeInsets.only(left: 8)),
                          ),
                          const Expanded(
                            flex: 4,
                            child:
                                Icon(Icons.attachment), // or use an icon button
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }
}
