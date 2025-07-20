import 'package:flutter/material.dart';

class AppointmentDataTable extends StatefulWidget {
  const AppointmentDataTable({super.key});

  @override
  State<AppointmentDataTable> createState() => _AppointmentDataTableState();
}

class _AppointmentDataTableState extends State<AppointmentDataTable>
    with SingleTickerProviderStateMixin {
  int? sortColumnIndex;
  bool isAscending = true;
  int? hoveredRowIndex;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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

  void _showActionDialog(String action, String patientName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$action Appointment'),
        content: Text(
            'Are you sure you want to $action appointment for $patientName?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$action action completed for $patientName'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Text(action),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
        ),
      ),
    );
  }

  Widget buildStatusChip(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simple header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Appointments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${tableData.length} total',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Table with enhanced UX
            Scrollbar(
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
                          fontSize: 13,
                        ),
                        dataRowColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.blue.shade50;
                            }
                            return Colors.transparent;
                          },
                        ),
                        dataTextStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                        dividerThickness: 1,
                      ),
                    ),
                    child: DataTable(
                      sortColumnIndex: sortColumnIndex,
                      sortAscending: isAscending,
                      showCheckboxColumn: false,
                      headingRowHeight: 48,
                      dataRowHeight: 60,
                      horizontalMargin: 20,
                      columnSpacing: 24,
                      columns: [
                        const DataColumn(
                          label: Text('Actions'),
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Patient'),
                              if (sortColumnIndex == 1) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Date'),
                              if (sortColumnIndex == 2) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Time'),
                              if (sortColumnIndex == 3) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Treatment'),
                              if (sortColumnIndex == 4) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Status'),
                              if (sortColumnIndex == 5) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Payment'),
                              if (sortColumnIndex == 6) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Duration'),
                              if (sortColumnIndex == 7) ...[
                                const SizedBox(width: 4),
                                Icon(
                                  isAscending
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: 16,
                                  color: Colors.blue.shade600,
                                ),
                              ],
                            ],
                          ),
                          onSort: onSort,
                        ),
                      ],
                      rows: tableData.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> data = entry.value;

                        return DataRow(
                          color: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Colors.blue.shade50;
                              }
                              return index % 2 == 0
                                  ? Colors.white
                                  : Colors.grey.shade50;
                            },
                          ),
                          onSelectChanged: (selected) {
                            // Quick view on row tap
                            if (selected == true) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Appointment Details'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Patient: ${data['patientName']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 8),
                                      Text('Date: ${data['date']}'),
                                      Text('Time: ${data['time']}'),
                                      Text('Treatment: ${data['treatment']}'),
                                      Text('Duration: ${data['duration']}'),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          buildStatusChip(
                                              data['appointment'],
                                              _getStatusColor(
                                                  data['appointment'])),
                                          const SizedBox(width: 8),
                                          buildStatusChip(
                                              data['payment'],
                                              _getPaymentColor(
                                                  data['payment'])),
                                        ],
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          cells: [
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildActionButton(
                                    icon: Icons.edit,
                                    color: Colors.blue.shade600,
                                    onPressed: () => _showActionDialog(
                                        'Edit', data['patientName']),
                                    tooltip: 'Edit appointment',
                                  ),
                                  buildActionButton(
                                    icon: Icons.delete,
                                    color: Colors.red.shade500,
                                    onPressed: () => _showActionDialog(
                                        'Delete', data['patientName']),
                                    tooltip: 'Delete appointment',
                                  ),
                                  buildActionButton(
                                    icon: Icons.visibility,
                                    color: Colors.green.shade600,
                                    onPressed: () => _showActionDialog(
                                        'View', data['patientName']),
                                    tooltip: 'View details',
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Text(
                                data['patientName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            DataCell(Text(data['date'])),
                            DataCell(Text(data['time'])),
                            DataCell(Text(data['treatment'])),
                            DataCell(
                              buildStatusChip(
                                data['appointment'],
                                _getStatusColor(data['appointment']),
                              ),
                            ),
                            DataCell(
                              buildStatusChip(
                                data['payment'],
                                _getPaymentColor(data['payment']),
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
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.orange.shade600;
      case 'confirmed':
        return Colors.blue.shade600;
      case 'completed':
        return Colors.green.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Color _getPaymentColor(String payment) {
    switch (payment.toLowerCase()) {
      case 'paid':
        return Colors.green.shade600;
      case 'pending':
        return Colors.orange.shade600;
      case 'partial':
        return Colors.blue.shade600;
      default:
        return Colors.grey.shade600;
    }
  }
}
