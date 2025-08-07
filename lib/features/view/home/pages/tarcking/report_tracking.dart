import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import 'package:intl/intl.dart';
import '../../../../view%20model/home%20controller/reports_controller.dart';
import '../../../../view%20model/settings%20controllers/theme_controller.dart';

class ReportTracking extends StatefulWidget {
  const ReportTracking({super.key});

  @override
  State<ReportTracking> createState() => _ReportTrackingState();
}

class _ReportTrackingState extends State<ReportTracking> {
  final ReportsController reportsController = Get.put<ReportsController>(
    ReportsController(),
  );
  final ThemeController themectrl = Get.find();

  @override
  void initState() {
    super.initState();
    // Fetch user reports when the page loads
    reportsController.fetchUserReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'report_tracking'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (reportsController.isLoadingReports.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final reports = reportsController.userReports;

        if (reports.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text('no_reports'.tr, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text(
                  'You haven\'t submitted any reports yet.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => reportsController.fetchUserReports(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              final DateTime timestamp = DateTime.parse(report['created_at']);
              final String formattedDate = DateFormat(
                'MMM dd, yyyy - HH:mm',
              ).format(timestamp);

              // Determine status color based on progress_status
              Color statusColor;
              String displayStatus;
              switch (report['progress_status'] ?? report['status']) {
                case 'submitted':
                  statusColor = Colors.blue;
                  displayStatus = 'Submitted';
                  break;
                case 'initial_review':
                  statusColor = Colors.orange;
                  displayStatus = 'Under Review';
                  break;
                case 'under_investigation':
                  statusColor = Colors.purple;
                  displayStatus = 'Investigating';
                  break;
                case 'evidence_collection':
                  statusColor = Colors.indigo;
                  displayStatus = 'Collecting Evidence';
                  break;
                case 'legal_assessment':
                  statusColor = Colors.amber;
                  displayStatus = 'Legal Assessment';
                  break;
                case 'action_taken':
                  statusColor = Colors.teal;
                  displayStatus = 'Action Taken';
                  break;
                case 'case_closed':
                  statusColor = Colors.green;
                  displayStatus = 'Resolved';
                  break;
                case 'pending':
                  statusColor = Colors.orange;
                  displayStatus = 'Pending';
                  break;
                default:
                  statusColor = Colors.grey;
                  displayStatus = report['status'] ?? 'Unknown';
              }

              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                            child: Text(
                              report['report_type_title'] ??
                                  'Unknown Report Type',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: statusColor),
                            ),
                            child: Text(
                              displayStatus,
                              style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Report ID: #${report['id']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        report['description'] ?? 'No description provided',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      if (report['city'] != null ||
                          report['market_name'] != null)
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                '${report['market_name'] ?? ''}, ${report['city'] ?? ''}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to report details with the report ID
                              Get.toNamed(
                                '/report_details',
                                arguments: report['id'],
                              );
                            },
                            child: Text(
                              'view_details'.tr,
                              style: TextStyle(
                                color:
                                    themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? Colors.white
                                        : kmaincolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
