import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import '../../../../view model/home controller/reports_controller.dart';

class Reporting extends StatelessWidget {
  const Reporting({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ReportsController controller = Get.put(ReportsController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'reporting'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          image: DecorationImage(
            image: const AssetImage(
              'lib/core/assets/images/homeimages/grocery.png',
            ),
            fit: BoxFit.fitWidth,
            opacity: 0.2,
            colorFilter: ColorFilter.mode(
              kmaincolor.withValues(alpha: 0.0),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.reportTypes.length,
          itemBuilder: (context, index) {
            final reportType = controller.reportTypes[index];
            // Use reportType['id'] instead of index
            return _buildReportCard(reportType, context, controller);
          },
        ),
      ),
    );
  }

  Widget _buildReportCard(
    Map<String, dynamic> reportType,
    BuildContext context,
    ReportsController controller,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Extract ID from reportType
          controller.navigateToReportDetails(
            reportType['id'],
            reportType,
            context,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with colored background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: reportType['color'].withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  reportType['icon'],
                  color: reportType['color'],
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reportType['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reportType['description'],
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(Icons.arrow_forward_ios, color: kmaincolor, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
