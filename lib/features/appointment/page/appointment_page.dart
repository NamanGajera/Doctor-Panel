import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

class _AppointmentpageState extends State<Appointmentpage> {
  int _currentTabIndex = 0;

  // Sample data for tab counts - you would get this from your actual data
  final List<String> _tabs = [
    'All Appointments (200)',
    'Approved',
    'Cancelled',
    'Pending'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabs: _tabs,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          initialIndex: _currentTabIndex,
          onTabSelected: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          selectedTabColor: primaryDarkBlueColor,
          backgroundColor: Colors.grey.shade200,
          borderRadius: 8.0,
          height: 30.0,
        ),
        const SizedBox(height: 20),
        const EnhancedDataTableWidget(),
        // SizedBox(
        //   width: double.infinity,
        //   child: DataTable(
        //     columns: const [
        //       DataColumn(label: Text('Actions')),
        //       DataColumn(label: Text('Patient Name')),
        //       DataColumn(label: Text('Date')),
        //       DataColumn(label: Text('Time')),
        //       DataColumn(label: Text('Treatment')),
        //       DataColumn(label: Text('Appointment')),
        //       DataColumn(label: Text('Payment')),
        //       DataColumn(label: Text('Duration')),
        //     ],
        //     rows: [
        //       DataRow(
        //         cells: [
        //           DataCell(Row(
        //             children: [
        //               Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.blue.withValues(alpha: 0.2),
        //                   shape: BoxShape.circle,
        //                 ),
        //                 padding: EdgeInsets.all(4),
        //                 child: Icon(
        //                   Icons.edit,
        //                   size: 16,
        //                   color: Colors.blue,
        //                 ),
        //               ),
        //               Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.red.withValues(alpha: 0.2),
        //                   shape: BoxShape.circle,
        //                 ),
        //                 padding: EdgeInsets.all(4),
        //                 child: Icon(
        //                   Icons.delete,
        //                   size: 16,
        //                   color: Colors.red,
        //                 ),
        //               ),
        //               Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.green.withValues(alpha: 0.2),
        //                   shape: BoxShape.circle,
        //                 ),
        //                 padding: EdgeInsets.all(4),
        //                 child: Icon(
        //                   Icons.remove_red_eye_outlined,
        //                   size: 16,
        //                   color: Colors.green,
        //                 ),
        //               ),
        //             ],
        //           )),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //           DataCell(Text('Tttt')),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ).withPadding(const EdgeInsets.symmetric(horizontal: 15, vertical: 6));
  }
}

// import 'package:flutter/material.dart';

class EnhancedDataTableWidget extends StatefulWidget {
  const EnhancedDataTableWidget({super.key});

  @override
  _EnhancedDataTableWidgetState createState() =>
      _EnhancedDataTableWidgetState();
}

class _EnhancedDataTableWidgetState extends State<EnhancedDataTableWidget> {
  int? sortColumnIndex;
  bool isAscending = true;

  // Sample data - replace with your actual data
  List<Map<String, dynamic>> tableData = [
    {
      'patientName': 'John Doe',
      'date': '2024-01-15',
      'time': '10:00 AM',
      'treatment': 'Cleaning',
      'appointment': 'Scheduled',
      'payment': 'Paid',
      'duration': '30 min'
    },
    {
      'patientName': 'Jane Smith',
      'date': '2024-01-16',
      'time': '2:00 PM',
      'treatment': 'Filling',
      'appointment': 'Confirmed',
      'payment': 'Pending',
      'duration': '45 min'
    },
    {
      'patientName': 'Mike Johnson',
      'date': '2024-01-17',
      'time': '11:30 AM',
      'treatment': 'Checkup',
      'appointment': 'Completed',
      'payment': 'Paid',
      'duration': '20 min'
    },
    {
      'patientName': 'Sarah Wilson',
      'date': '2024-01-18',
      'time': '3:30 PM',
      'treatment': 'Root Canal',
      'appointment': 'Scheduled',
      'payment': 'Partial',
      'duration': '90 min'
    },
  ];

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });

    switch (columnIndex) {
      case 1: // Patient Name
        tableData.sort((a, b) => ascending
            ? a['patientName'].compareTo(b['patientName'])
            : b['patientName'].compareTo(a['patientName']));
        break;
      case 2: // Date
        tableData.sort((a, b) => ascending
            ? DateTime.parse(a['date']).compareTo(DateTime.parse(b['date']))
            : DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));
        break;
      case 3: // Time
        tableData.sort((a, b) => ascending
            ? a['time'].compareTo(b['time'])
            : b['time'].compareTo(a['time']));
        break;
      case 4: // Treatment
        tableData.sort((a, b) => ascending
            ? a['treatment'].compareTo(b['treatment'])
            : b['treatment'].compareTo(a['treatment']));
        break;
      case 5: // Appointment
        tableData.sort((a, b) => ascending
            ? a['appointment'].compareTo(b['appointment'])
            : b['appointment'].compareTo(a['appointment']));
        break;
      case 6: // Payment
        tableData.sort((a, b) => ascending
            ? a['payment'].compareTo(b['payment'])
            : b['payment'].compareTo(a['payment']));
        break;
      case 7: // Duration
        tableData.sort((a, b) => ascending
            ? a['duration'].compareTo(b['duration'])
            : b['duration'].compareTo(a['duration']));
        break;
    }
  }

  Widget buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              size: 16,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.bottom,
          thumbVisibility: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 32,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dataTableTheme: DataTableThemeData(
                    headingRowColor:
                        WidgetStateProperty.all(Colors.grey.shade100),
                    headingTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                    dataRowColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.blue.withValues(alpha: 0.1);
                        }
                        return Colors.transparent;
                      },
                    ),
                    dataTextStyle: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 13,
                    ),
                    dividerThickness: 0.5,
                  ),
                ),
                child: DataTable(
                  sortColumnIndex: sortColumnIndex,
                  sortAscending: isAscending,
                  showCheckboxColumn: false,
                  headingRowHeight: 50,
                  dataRowHeight: 60,
                  horizontalMargin: 16,
                  columnSpacing:
                      MediaQuery.of(context).size.width > 768 ? 24 : 16,
                  columns: [
                    DataColumn(
                      label: Tooltip(
                        message: 'Available actions for each row',
                        child: Container(
                          child: const Text('Actions'),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by patient name',
                        child: Text('Patient Name'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by date',
                        child: Text('Date'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by time',
                        child: Text('Time'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by treatment type',
                        child: Text('Treatment'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by appointment status',
                        child: Text('Appointment'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by payment status',
                        child: Text('Payment'),
                      ),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: const Tooltip(
                        message: 'Click to sort by duration',
                        child: Text('Duration'),
                      ),
                      onSort: onSort,
                    ),
                  ],
                  rows: tableData.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> data = entry.value;

                    return DataRow(
                      color: WidgetStateProperty.all(
                        index % 2 == 0 ? Colors.white : Colors.grey.shade50,
                      ),
                      cells: [
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildActionButton(
                                icon: Icons.edit_outlined,
                                color: Colors.blue,
                                onPressed: () {
                                  // Edit action
                                  print(
                                      'Edit pressed for ${data['patientName']}');
                                },
                                tooltip: 'Edit',
                              ),
                              buildActionButton(
                                icon: Icons.delete_outline,
                                color: Colors.red,
                                onPressed: () {
                                  // Delete action
                                  print(
                                      'Delete pressed for ${data['patientName']}');
                                },
                                tooltip: 'Delete',
                              ),
                              buildActionButton(
                                icon: Icons.visibility_outlined,
                                color: Colors.green,
                                onPressed: () {
                                  // View action
                                  print(
                                      'View pressed for ${data['patientName']}');
                                },
                                tooltip: 'View',
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(data['patientName'])),
                        DataCell(Text(data['date'])),
                        DataCell(Text(data['time'])),
                        DataCell(Text(data['treatment'])),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _getStatusColor(data['appointment']),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              data['appointment'],
                              style: TextStyle(
                                color: _getStatusColor(data['appointment']),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _getPaymentColor(data['payment']),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              data['payment'],
                              style: TextStyle(
                                color: _getPaymentColor(data['payment']),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        DataCell(Text(data['duration'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Color _getPaymentColor(String payment) {
    switch (payment.toLowerCase()) {
      case 'paid':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'partial':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
