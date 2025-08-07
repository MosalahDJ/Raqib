import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import '../../../../view%20model/settings%20controllers/theme_controller.dart';

class Helpandfedback extends StatefulWidget {
  const Helpandfedback({super.key});

  @override
  State<Helpandfedback> createState() => _HelpandfedbackState();
}

class _HelpandfedbackState extends State<Helpandfedback>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'help&feedback'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(text: 'FAQs'.tr),
            Tab(text: 'Contact'.tr),
            Tab(text: 'Feedback'.tr),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildFAQsTab(), _buildContactTab(), _buildFeedbackTab()],
      ),
    );
  }

  Widget _buildFAQsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFAQItem('faq_what_is'.tr, 'faq_what_is_answer'.tr),
        _buildFAQItem('faq_report_how'.tr, 'faq_report_how_answer'.tr),
        _buildFAQItem('faq_track_how'.tr, 'faq_track_how_answer'.tr),
        _buildFAQItem('faq_violations'.tr, 'faq_violations_answer'.tr),
        _buildFAQItem('faq_privacy'.tr, 'faq_privacy_answer'.tr),
        _buildFAQItem('faq_update_info'.tr, 'faq_update_info_answer'.tr),
        _buildFAQItem('faq_offline'.tr, 'faq_offline_answer'.tr),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    final ThemeController themectrl = Get.find();
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent, width: 1),

        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                themectrl.selectedTheme.value == AppTheme.dark
                    ? Colors.white
                    : kmaincolor,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(answer, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'contact_information'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildContactItem(Icons.email, 'email'.tr, 'support@Raqib.dz'),
                const Divider(),
                _buildContactItem(Icons.phone, 'phone'.tr, '+213 123 456 789'),
                const Divider(),
                _buildContactItem(
                  Icons.location_on,
                  'address'.tr,
                  'Ministry of Trade, Algiers, Algeria',
                ),
                const Divider(),
                _buildContactItem(
                  Icons.access_time,
                  'working_hours'.tr,
                  'Sunday - Thursday: 8:00 AM - 4:00 PM',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'emergency_contacts'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  Icons.emergency,
                  'consumer_protection_hotline'.tr,
                  '1020',
                ),
                const Divider(),
                _buildContactItem(
                  Icons.security,
                  'trade_fraud_reporting'.tr,
                  '1055',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'social_media'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kmaincolor,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSocialMediaItem(
                  Icons.facebook,
                  'facebook'.tr,
                  '@RaqibAlgeria',
                ),
                const Divider(),
                _buildSocialMediaItem(
                  Icons.telegram,
                  'telegram'.tr,
                  '@RaqibAlgeria',
                ),
                const Divider(),
                _buildSocialMediaItem(Icons.web, 'website'.tr, 'www.Raqib.dz'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: kmaincolor),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaItem(IconData icon, String platform, String handle) {
    return InkWell(
      onTap: () {
        // TODO: Implement social media link opening
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: kmaincolor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  handle,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackTab() {
    final ThemeController themectrl = Get.find();
    final bool isDark = themectrl.selectedTheme.value == AppTheme.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'feedback_title'.tr,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : kmaincolor,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'feedback_subtitle'.tr,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey[300] : Colors.grey,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _nameController,
              label: 'full_name'.tr,
              hint: 'enter_full_name'.tr,
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_full_name'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _emailController,
              label: 'email'.tr,
              hint: 'enter_email'.tr,

              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_email'.tr;
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'valid_email'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'feedback_type'.tr,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  color: isDark ? Colors.white : Colors.black87,
                ),
                prefixIcon: Icon(
                  Icons.category,
                  color: isDark ? Colors.white70 : kmaincolor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDark ? Colors.white70 : kmaincolor,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: isDark ? Color(0xFF424242) : Colors.white,
              ),
              dropdownColor: isDark ? Color(0xFF424242) : Colors.white,
              style: TextStyle(
                fontFamily: 'Cairo',
                color: isDark ? Colors.white : Colors.black87,
              ),
              items: [
                DropdownMenuItem(
                  value: 'suggestion',
                  child: Text(
                    'suggestion'.tr,
                    style: const TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                DropdownMenuItem(
                  value: 'bug',
                  child: Text(
                    'bug_report'.tr,
                    style: const TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                DropdownMenuItem(
                  value: 'content',
                  child: Text(
                    'content_issue'.tr,
                    style: const TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                DropdownMenuItem(
                  value: 'other',
                  child: Text(
                    'other'.tr,
                    style: const TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
              ],
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'select_feedback_type'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _messageController,
              label: 'feedback_message'.tr,
              hint: 'enter_feedback_message'.tr,
              icon: Icons.message,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_message'.tr;
                }
                if (value.length < 10) {
                  return 'min_message_length'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kmaincolor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'submit_feedback'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    final ThemeController themectrl = Get.find();
    final bool isDark = themectrl.selectedTheme.value == AppTheme.dark;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Color(0xFF424242) : Colors.white,
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Cairo',
          color: isDark ? Colors.white70 : Colors.black87,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Cairo',
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        prefixIcon: Icon(icon, color: isDark ? Colors.white70 : kmaincolor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: isDark ? Colors.white70 : kmaincolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white : kmaincolor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white38 : kmaincolor.withValues(alpha: 0.5),
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Cairo',
        color: isDark ? Colors.white : Colors.black87,
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  // Update the _submitFeedback method
  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'feedback_submitted'.tr,
            style: const TextStyle(fontFamily: 'Cairo'),
          ),
          backgroundColor: Colors.green,
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }
}
