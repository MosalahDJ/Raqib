import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import '../../../../view%20model/settings%20controllers/theme_controller.dart';
// import 'package:intl/intl.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kmaincolor,
        title: Text(
          'info'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context, 'latest_raqib_news'.tr),
          const SizedBox(height: 16),
          _buildNewsArticle(
            title: 'new_data_privacy_law'.tr,
            date: '10 August 2023',
            source: 'Trade.gov',
            content: 'data_privacy_content'.tr,
            imagepath: 'lib/core/assets/images/laws_mages/dataprotection.webp',
          ),
          const SizedBox(height: 12),
          _buildNewsArticle(
            title: 'new_legislation_ip'.tr,
            date: '15 March 2023',
            source: 'U.S. Department of State',
            content: 'ip_legislation_content'.tr,
            imagepath: 'lib/core/assets/images/laws_mages/ip_law.jpg',
          ),
          const SizedBox(height: 12),
          _buildNewsArticle(
            title: 'new_digital_strategy'.tr,
            date: '20 January 2024',
            source: 'Trade.gov',
            content: 'digital_strategy_content'.tr,
            imagepath: 'lib/core/assets/images/laws_mages/digital_strategy.jpg',
          ),
          const SizedBox(height: 24),
          _buildHeader(context, 'economic_reports_magazines'.tr),
          const SizedBox(height: 16),
          _buildMagazineReport(
            title: 'investment_climate_report'.tr,
            publisher: 'U.S. Department of State',
            date: 'January 2024',
            summary:
                'The report highlights that Algeria permits the inclusion of international arbitration clauses in contracts. Investment disputes can be settled informally through negotiations between the parties or via the domestic court system. For disputes with foreign investors, cases can also be decided through international arbitration. In 2023, the government created an inter-ministerial committee to audit companies\' financial records and impose fines for illegal activities.',
            imagepath:
                'lib/core/assets/images/laws_mages/investment_report.jpg',
          ),
          const SizedBox(height: 12),
          _buildMagazineReport(
            title: 'algeria_stable_economy'.tr,
            publisher: 'Allianz Trade',
            date: 'April 2024',
            summary:
                'Algeria\'s GDP growth is expected to slow to +2.7% in 2025 from +3.0% in 2024. The downward trend in global natural gas prices is causing a gradual decline of Algerian growth from the +4% averaged between 2021-2023. Inflation is projected to slightly pick up in 2025 to 5.5% following a downward shift in the first half of 2024 from the 9% recorded in late 2023.',
            imagepath: 'lib/core/assets/images/laws_mages/alianz_report.jpg',
          ),
          const SizedBox(height: 12),
          _buildMagazineReport(
            title: 'world_bank_report'.tr,
            publisher: 'World Bank',
            date: 'December 2023',
            summary:
                'The World Bank\'s report on the Algerian economy calls for the acceleration of institutional and micro-economic reforms. The report notes that the promulgation in 2022 of the new investment law and the publication of its implementing regulations, the abolition in 2020 of the 51/49 rule for non-strategic sectors, and the publication of the new hydrocarbons law in 2019 are positive steps, but must tackle the ecosystem, including paralyzing bureaucracy.',
            imagepath: 'lib/core/assets/images/laws_mages/WorldBank.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    final ThemeController themectrl = Get.find();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color:
              themectrl.selectedTheme.value == AppTheme.dark
                  ? Colors.white
                  : kmaincolor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNewsArticle({
    required String title,
    required String date,
    required String source,
    required String content,
    required String imagepath,
  }) {
    final ThemeController themectrl = Get.find();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent, width: 1),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                themectrl.selectedTheme.value == AppTheme.dark
                    ? Colors.white
                    : kmaincolor,
          ),
        ),
        subtitle: Text('$source • $date'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagepath,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, size: 50),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(content, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement read more functionality
                    },
                    child: Text(
                      'read_more'.tr,
                      style: TextStyle(
                        color:
                            themectrl.selectedTheme.value == AppTheme.dark
                                ? Colors.white
                                : kmaincolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMagazineReport({
    required String title,
    required String publisher,
    required String date,
    required String summary,
    required String imagepath,
  }) {
    final ThemeController themectrl = Get.find();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagepath,
                height: 120,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.book, size: 30),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:
                          themectrl.selectedTheme.value == AppTheme.dark
                              ? Colors.white
                              : kmaincolor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$publisher • $date',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    summary,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Implement view report functionality
                      },
                      child: Text(
                        'view_report'.tr,
                        style: TextStyle(
                          color:
                              themectrl.selectedTheme.value == AppTheme.dark
                                  ? Colors.white
                                  : kmaincolor,
                        ),
                      ),
                    ),
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
