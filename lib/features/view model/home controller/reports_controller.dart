import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/Utils/constants.dart';

class ReportsController extends GetxController {
  // Get Supabase client instance
  final _supabase = Supabase.instance.client;

  // Report types data
  final List<Map<String, dynamic>> reportTypes = [
    {
      'id': 1,
      'title': 'Price Manipulation'.tr,
      'icon': Icons.attach_money,
      'color': kmaincolor,
      'description': 'd1'.tr,
    },
    {
      'id': 2,
      'title': 'Monopoly & Speculation'.tr,
      'icon': Icons.business_center,
      'color': kmaincolor4,
      'description': 'd2'.tr,
    },
    {
      'id': 3,
      'title': 'Expired Products'.tr,
      'icon': Icons.no_food,
      'color': kmaincolor2,
      'description': 'd3'.tr,
    },
    {
      'id': 4,
      'title': 'Illegal Products'.tr,
      'icon': Icons.warning_amber,
      'color': Colors.red.shade800,
      'description': 'd4'.tr,
    },
    {
      'id': 5,
      'title': 'Hygiene Violations'.tr,
      'icon': Icons.cleaning_services,
      'color': Colors.teal.shade700,
      'description': 'd5'.tr,
    },
    {
      'id': 6,
      'title': 'Other Violations'.tr,
      'icon': Icons.report_problem,
      'color': Colors.amber.shade800,
      'description': 'd6'.tr,
    },
  ];

  // Form controllers
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController marketNameController = TextEditingController();
  final TextEditingController marketNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Form state
  final RxBool isSubmitting = false.obs;

  // Selected report type
  Rx<Map<String, dynamic>?> selectedReportType = Rx<Map<String, dynamic>?>(
    null,
  );

  @override
  void onClose() {
    // Dispose controllers when the controller is closed
    cityController.dispose();
    townController.dispose();
    villageController.dispose();
    marketNameController.dispose();
    marketNumberController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // Navigate to report details page
  void navigateToReportDetails(
    int reportid,
    Map<String, dynamic> reportType,
    BuildContext context,
  ) {
    selectedReportType.value = reportType;
    Navigator.pushNamed(context, '/report_information', arguments: reportid);
    // OR use Get navigation instead:
    // Get.toNamed('/report_information', arguments: reportType);
  }

  // Submit report logic
  Future<void> submitReport(
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      // Check if a report type is selected
      if (selectedReportType.value == null) {
        Get.snackbar(
          'Error',
          'Please select a report type',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      isSubmitting.value = true;

      try {
        // Get current user
        final user = _supabase.auth.currentUser;
        if (user == null) {
          throw Exception('User not authenticated');
        }

        // Prepare report data
        final reportData = {
          'user_id': user.id,
          'report_type_id': selectedReportType.value!['id'],
          'report_type_title': selectedReportType.value!['title'],
          'city': cityController.text.trim(),
          'town':
              townController.text.trim().isEmpty
                  ? null
                  : townController.text.trim(),
          'village':
              villageController.text.trim().isEmpty
                  ? null
                  : villageController.text.trim(),
          'market_name': marketNameController.text.trim(),
          'market_number':
              marketNumberController.text.trim().isEmpty
                  ? null
                  : marketNumberController.text.trim(),
          'description': descriptionController.text.trim(),
          'progress_status': "submitted",
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        };

        // Insert report into Supabase
            await _supabase
                .from('reports')
                .insert(reportData)
                .select()
                .single();

        // Show success dialog
        // ignore: use_build_context_synchronously
        showSuccessDialog(context);
      } on PostgrestException catch (e) {
        // Handle Supabase-specific errors
        Get.snackbar(
          'Database Error',
          'Failed to submit report: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      } on AuthException catch (e) {
        // Handle authentication errors
        Get.snackbar(
          'Authentication Error',
          'Please log in to submit a report: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        // Handle other errors
        Get.snackbar(
          'Error',
          'Failed to submit report: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isSubmitting.value = false;
      }
    }
  }

  // Show success dialog
  void showSuccessDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              const Text('Report Submitted'),
            ],
          ),
          content: const Text(
            'Thank you for your report. The authorities will review your submission and take appropriate action.',
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kmaincolor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                cityController.clear();
                townController.clear();
                villageController.clear();
                marketNameController.clear();
                marketNumberController.clear();
                descriptionController.clear();
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to reports list
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Reset form fields
  void resetForm() {
    cityController.clear();
    townController.clear();
    villageController.clear();
    marketNameController.clear();
    marketNumberController.clear();
    descriptionController.clear();
  }

  // Add these translation methods to the ReportsController class
  Map<String, dynamic> getTranslatedReportType(
    Map<String, dynamic> reportType,
  ) {
    // Create a copy of the report type to avoid modifying the original
    final translatedType = Map<String, dynamic>.from(reportType);

    // The title and description will be translated in the UI using .tr
    return translatedType;
  }

  // Observable list for user reports
  final RxList<Map<String, dynamic>> userReports = <Map<String, dynamic>>[].obs;
  final RxBool isLoadingReports = false.obs;

  // Fetch user's reports
  Future<void> fetchUserReports() async {
    try {
      isLoadingReports.value = true;

      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final response = await _supabase
          .from('reports')
          .select('*')
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      userReports.value = List<Map<String, dynamic>>.from(response);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch reports: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoadingReports.value = false;
    }
  }

  // Progress status definitions
  static const List<Map<String, dynamic>> progressSteps = [
    {
      'step': 1,
      'status': 'submitted',
      'title': 'Report Submitted',
      'description':
          'Your report has been successfully submitted to our system.',
      'icon': Icons.assignment_turned_in,
    },
    {
      'step': 2,
      'status': 'initial_review',
      'title': 'Initial Review',
      'description':
          'Our team has reviewed your report and determined it requires further investigation.',
      'icon': Icons.find_in_page,
    },
    {
      'step': 3,
      'status': 'under_investigation',
      'title': 'Under Investigation',
      'description':
          'Field agents have been assigned to investigate the reported issue.',
      'icon': Icons.search,
    },
    {
      'step': 4,
      'status': 'evidence_collection',
      'title': 'Evidence Collection',
      'description':
          'Our team is collecting evidence and documenting findings.',
      'icon': Icons.photo_camera,
    },
    {
      'step': 5,
      'status': 'legal_assessment',
      'title': 'Legal Assessment',
      'description':
          'Legal team is reviewing the evidence and determining appropriate actions.',
      'icon': Icons.gavel,
    },
    {
      'step': 6,
      'status': 'action_taken',
      'title': 'Action Taken',
      'description':
          'Enforcement actions will be taken based on investigation findings.',
      'icon': Icons.policy,
    },
    {
      'step': 7,
      'status': 'case_closed',
      'title': 'Case Closed',
      'description':
          'The case has been resolved and appropriate measures have been implemented.',
      'icon': Icons.task_alt,
    },
  ];

  // Generate tracking steps based on current progress status
  List<Map<String, dynamic>> generateTrackingSteps(
    String currentStatus,
    DateTime? createdAt,
  ) {
    final List<Map<String, dynamic>> trackingSteps = [];

    for (int i = 0; i < progressSteps.length; i++) {
      final step = Map<String, dynamic>.from(progressSteps[i]);

      // Determine if this step is completed
      final currentStepIndex = progressSteps.indexWhere(
        (s) => s['status'] == currentStatus,
      );
      final isCompleted = i <= currentStepIndex;

      step['completed'] = isCompleted;

      // Add timestamp for completed steps
      if (isCompleted && createdAt != null) {
        // For demo purposes, add timestamps based on step progression
        step['timestamp'] = createdAt.add(Duration(days: i));
      } else {
        step['timestamp'] = null;
      }

      trackingSteps.add(step);
    }

    return trackingSteps;
  }

  // Get report with tracking data
  Future<Map<String, dynamic>?> getReportWithTracking(int reportId) async {
    try {
      final response =
          await _supabase
              .from('reports')
              .select('*')
              .eq('id', reportId)
              .single();

      // Generate tracking steps based on current progress status
      final trackingSteps = generateTrackingSteps(
        response['progress_status'] ?? 'submitted',
        DateTime.parse(response['created_at']),
      );

      response['tracking'] = trackingSteps;
      return response;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch report: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  // Update report progress status (for admin use)
  Future<void> updateReportProgress(int reportId, String newStatus) async {
    try {
      await _supabase
          .from('reports')
          .update({
            'progress_status': newStatus,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', reportId);

      Get.snackbar(
        'Success',
        'Report progress updated successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Refresh reports list
      await fetchUserReports();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update progress: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
