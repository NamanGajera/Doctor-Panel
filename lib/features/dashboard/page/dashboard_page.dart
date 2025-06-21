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
            SizedBox(
              width: double.infinity,
              child: DataTable(
                showCheckboxColumn: true,
                columns: const [
                  DataColumn(label: Text('Patient Name')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Treatment')),
                  DataColumn(label: Text('Appointment')),
                  DataColumn(label: Text('Payment')),
                  DataColumn(label: Text('Duration')),
                ],
                rows: [
                  DataRow(
                    onSelectChanged: (value) {},
                    cells: const [
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                      DataCell(Text('Tttt')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
