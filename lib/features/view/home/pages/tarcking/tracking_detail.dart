import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raqib/features/view%20model/settings%20controllers/theme_controller.dart';
import '../../../../../core/Utils/constants.dart';
import 'package:intl/intl.dart';
import '../../../../view%20model/home%20controller/reports_controller.dart';

class TrackingDetail extends StatelessWidget {
  final int reportId;

  const TrackingDetail({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    final ReportsController reportsController = Get.find();
    final ThemeController themectrl = Get.find();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'tracking_detail'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: reportsController.getReportWithTracking(reportId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                'report_not_found'.tr,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
          
          final report = snapshot.data!;
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Report Information Card
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.black38
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.black.withValues(alpha: 0.2)
                            : Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    report['report_type_title'] ?? 'Unknown Report',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'ID: #${report['id'].toString().padLeft(6, '0')}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(report['progress_status'] ?? 'submitted').withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _getStatusColor(report['progress_status'] ?? 'submitted'),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                _getStatusDisplayName(report['progress_status'] ?? 'submitted'),
                                style: TextStyle(
                                  color: _getStatusColor(report['progress_status'] ?? 'submitted'),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                          Icons.description,
                          'description'.tr,
                          report['description'] ?? 'No description',
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                          Icons.location_on,
                          'location'.tr,
                          '${report['city']}, ${report['market_name']}',
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                          Icons.calendar_today,
                          'submitted_on'.tr,
                          DateFormat('MMMM dd, yyyy - HH:mm').format(
                            DateTime.parse(report['created_at']),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tracking Timeline Section Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'tracking_progress'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Tracking Timeline
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.black38
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.black.withValues(alpha: 0.2)
                            : Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: _buildTrackingTimeline(report['tracking']),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper method to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'submitted':
        return Colors.blue;
      case 'initial_review':
        return Colors.orange;
      case 'under_investigation':
        return Colors.purple;
      case 'evidence_collection':
        return Colors.indigo;
      case 'legal_assessment':
        return Colors.amber;
      case 'action_taken':
        return Colors.green;
      case 'case_closed':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Helper method to get status display name
  String _getStatusDisplayName(String status) {
    switch (status) {
      case 'submitted':
        return 'Submitted';
      case 'initial_review':
        return 'Under Review';
      case 'under_investigation':
        return 'Investigating';
      case 'evidence_collection':
        return 'Collecting Evidence';
      case 'legal_assessment':
        return 'Legal Review';
      case 'action_taken':
        return 'Action Taken';
      case 'case_closed':
        return 'Closed';
      default:
        return 'Unknown';
    }
  }

  // Helper method to build info rows
  Widget _buildInfoRow(IconData icon, String label, String value) {
    final ThemeController themectrl = Get.find();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color:
              themectrl.selectedTheme.value == AppTheme.dark
                  ? Colors.white
                  : Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      themectrl.selectedTheme.value == AppTheme.dark
                          ? Colors.white
                          : Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to build the tracking timeline
  List<Widget> _buildTrackingTimeline(List<dynamic> trackingSteps) {
    final List<Widget> timelineItems = [];
    final ThemeController themectrl = Get.find();

    for (int i = 0; i < trackingSteps.length; i++) {
      final step = trackingSteps[i];
      final bool isLast = i == trackingSteps.length - 1;

      timelineItems.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator and line
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: step['completed'] ? kmaincolor : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(step['icon'], color: Colors.white, size: 16),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50,
                    color: step['completed'] ? kmaincolor : Colors.grey[300],
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            // Step content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        step['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              step['completed']
                                  ? themectrl.selectedTheme.value ==
                                          AppTheme.dark
                                      ? Colors.white
                                      : Colors.grey[600]
                                  : Colors.grey[600],
                        ),
                      ),
                      if (step['timestamp'] != null)
                        Text(
                          DateFormat('MMM dd, yyyy').format(step['timestamp']),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    step['description'],
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          step['completed']
                              ? themectrl.selectedTheme.value == AppTheme.dark
                                  ? Colors.white
                                  : Colors.grey[600]
                              : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return timelineItems;
  }
}
