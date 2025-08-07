import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view model/home controller/reports_controller.dart';
import '../../../../view%20model/settings%20controllers/theme_controller.dart';

class ReportInformationsPage extends StatelessWidget {
  final int reportId;

  const ReportInformationsPage({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    // Get the controller
    final ReportsController controller = Get.find<ReportsController>();
    final formKey = GlobalKey<FormState>();
    final ThemeController themectrl = Get.find();

    // Find the report type in the controller's list by ID
    final reportType = controller.reportTypes.firstWhere(
      (type) => type['id'] == reportId,
      orElse:
          () =>
              controller
                  .reportTypes[0], // Fallback to first report type if not found
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: reportType['color'],
        title: Text(
          "${'report'.tr} ${'${reportType['title']}'.tr}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Report type header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: reportType['color'].withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: reportType['color'].withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    reportType['icon'],
                    color: reportType['color'],
                    size: 36,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reportType['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: reportType['color'],
                            fontFamily: 'Cairo',
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          reportType['description'],
                          style: TextStyle(
                            color:
                                themectrl.selectedTheme.value == AppTheme.dark
                                    ? Colors.white
                                    : Colors.grey.shade700,
                            fontSize: 15,
                            fontFamily: 'Cairo',
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Location section
            _buildSectionHeader('location_information'.tr, Icons.location_on),
            const SizedBox(height: 16),

            // City field
            TextFormField(
              controller: controller.cityController,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              decoration: InputDecoration(
                labelText: 'city'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'enter_city_name'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.location_city,
                  color: reportType['color'],
                ),
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_city_name'.tr;
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Town field
            TextFormField(
              controller: controller.townController,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              decoration: InputDecoration(
                labelText: 'town_district'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'enter_town_district_name'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.apartment, color: reportType['color']),
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Village field
            TextFormField(
              controller: controller.villageController,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              decoration: InputDecoration(
                labelText: 'village_neighborhood'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'enter_village_neighborhood_name'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.home, color: reportType['color']),
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Market Information section
            _buildSectionHeader('market_information'.tr, Icons.store),
            const SizedBox(height: 16),

            // Market name field
            TextFormField(
              controller: controller.marketNameController,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              decoration: InputDecoration(
                labelText: 'market_store_name'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'enter_market_store_name'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.storefront, color: reportType['color']),
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_market_name'.tr;
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Market number field
            TextFormField(
              controller: controller.marketNumberController,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              decoration: InputDecoration(
                labelText: 'market_store_number'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'enter_market_store_number'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.tag, color: reportType['color']),
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            // Violation Description section
            _buildSectionHeader('violation_details'.tr, Icons.description),
            const SizedBox(height: 16),

            // Description field
            TextFormField(
              controller: controller.descriptionController,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 15,
                height: 1.4,
              ),
              decoration: InputDecoration(
                labelText: 'description'.tr,
                labelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: reportType['color'].withValues(alpha: 0.8),
                ),
                hintText: 'provide_violation_details'.tr,
                hintStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                alignLabelWithHint: true,
                filled: true,
                fillColor:
                    themectrl.selectedTheme.value == AppTheme.dark
                        ? Colors.white70
                        : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: reportType['color']),
                ),
              ),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_provide_violation_details'.tr;
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            // Submit button
            SizedBox(
              height: 50,
              child: Obx(
                () => ElevatedButton(
                  onPressed:
                      controller.isSubmitting.value
                          ? null
                          : () => controller.submitReport(formKey, context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: reportType['color'],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  child:
                      controller.isSubmitting.value
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'submitting'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.send),
                              const SizedBox(width: 8),
                              Text(
                                'submit_report'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    final ReportsController controller = Get.find<ReportsController>();
    final reportType = controller.reportTypes.firstWhere(
      (type) => type['id'] == reportId,
      orElse:
          () =>
              controller
                  .reportTypes[0], // Fallback to first report type if not found
    );
    return Row(
      children: [
        Icon(icon, color: reportType['color']),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: reportType['color'],
            fontFamily: 'Cairo',
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
