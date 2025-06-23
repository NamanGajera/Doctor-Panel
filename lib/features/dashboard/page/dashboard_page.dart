import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/features/dashboard/page/widget/appointment_card.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icons.dart';
import '../models/appointment_card_data_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<AppointmentCardDataModel> appointmentCardData = [
    AppointmentCardDataModel(
      title: 'Total Appointments',
      subTitle: 'Includes confirmed & pending',
      appointmentCount: 42,
      iconPath: AppIcons.personIcon,
      cardColor: const Color(0xFFECEAFF),
      showMoreButton: false,
      appointmentChangePercent: 8,
    ),
    AppointmentCardDataModel(
      title: 'Upcoming Today',
      subTitle: 'Next: Sarah Johnson at 10:30',
      appointmentCount: 12,
      iconPath: AppIcons.calendarIcon,
      cardColor: const Color(0xFFE6F7FF),
      showMoreButton: true,
    ),
    AppointmentCardDataModel(
      title: 'Pending Approvals',
      subTitle: 'Requires your confirmation',
      appointmentCount: 7,
      iconPath: AppIcons.clockIcon,
      cardColor: const Color(0xFFFFF4E6),
      showMoreButton: true,
    ),
    AppointmentCardDataModel(
      title: 'Completed Session',
      subTitle: 'This week\'s consultations',
      appointmentCount: 23,
      iconPath: AppIcons.checkMarkIcon,
      cardColor: const Color(0xFFd6e4e5),
      showMoreButton: true,
      appointmentChangePercent: 15,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.screenWidth < 370
                    ? 1
                    : context.screenWidth < 760
                        ? 2
                        : 4,
                mainAxisExtent: 170,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: appointmentCardData.length,
              itemBuilder: (context, index) {
                final AppointmentCardDataModel cardData =
                    appointmentCardData[index];
                return AppointmentCard(
                  title: cardData.title ?? '-',
                  subtitle: cardData.subTitle ?? '-',
                  value: '${cardData.appointmentCount ?? 0}',
                  iconPath: cardData.iconPath ?? '-',
                  iconBackgroundColor: Colors.white,
                  cardColor: cardData.cardColor ?? Colors.white,
                  showMoreButton: true,
                  trendValue: cardData.appointmentChangePercent == null
                      ? ''
                      : '+${cardData.appointmentChangePercent} vs last week',
                  trendPositive: true,
                );
              },
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
