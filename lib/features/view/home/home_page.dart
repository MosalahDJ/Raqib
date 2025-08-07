import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/Utils/constants.dart';
import '../../../core/Utils/size_config.dart';
import '../../view%20model/auth%20controller/login_controller.dart';
import '../../view%20model/settings%20controllers/language_controller.dart';
import '../../view%20model/settings%20controllers/theme_controller.dart';
import 'pages/help%20and%20fedback/help_and_fedback.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeController themectrl = Get.find();
  final LoginController loginctrl = Get.find();
  final LanguageController langctrl = Get.find();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize Sizeconfig to avoid null errors
    Sizeconfig().init(context);
    bool isDark = themectrl.isDarkMode;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kmaincolor,
          title: Text(
            _currentIndex == 0 ? 'home'.tr : 'help&fedback'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                themectrl.selectedTheme.value == AppTheme.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.white,
              ),
              onPressed: () {
                themectrl.changeTheme(
                  themectrl.selectedTheme.value == AppTheme.light
                      ? AppTheme.dark
                      : AppTheme.light,
                );
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.language_rounded, color: Colors.white),
              onSelected: (String value) {
                langctrl.changeLanguage(value);
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'en',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'en'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          const SizedBox(width: 8),
                          Text('english'.tr),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      
                      value: 'ar',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'ar'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          const SizedBox(width: 8),
                          Text('arabic'.tr),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'fr',
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color:
                                langctrl.language.value == 'fr'
                                    ? (themectrl.selectedTheme.value ==
                                            AppTheme.dark
                                        ? kmaincolor4dark
                                        : kmaincolor)
                                    : Colors.transparent,
                          ),
                          const SizedBox(width: 8),
                          Text('french'.tr),
                        ],
                      ),
                    ),
                  ],
            ),
            IconButton(
              icon: Obx(
                () =>
                    loginctrl.isLoading.value
                        ? CircularProgressIndicator(
                          strokeAlign: 0.7,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isDark ? kmaincolor : kmaincolor4,
                          ),
                        )
                        : Icon(Icons.logout_rounded, color: Colors.white),
              ),
              onPressed: loginctrl.isLoading.value ? null : loginctrl.signOut,
            ),
          ],
        ),
        body: _currentIndex == 0 ? _buildHomeTab() : const Helpandfedback(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: kmaincolor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 11,
          ),
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 0
                          ? (themectrl.selectedTheme.value == AppTheme.dark
                              ? kmaincolor4dark.withValues(alpha: 0.2)
                              : kmaincolor.withValues(alpha: 0.1))
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.home_rounded,
                  size: _currentIndex == 0 ? 26 : 22,
                ),
              ),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      _currentIndex == 1
                          ? (themectrl.selectedTheme.value == AppTheme.dark
                              ? kmaincolor4dark.withValues(alpha: 0.2)
                              : kmaincolor.withValues(alpha: 0.1))
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.help_outline_rounded,
                  size: _currentIndex == 1 ? 26 : 22,
                ),
              ),
              label: 'help&fedback'.tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Professional Products Card
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Dashboard'.tr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white
                            : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              _buildProductsCard(),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'our_services'.tr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white
                            : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Grid of other services (excluding help & feedback)
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(
                    icon: Icons.report_outlined,
                    title: 'reporting'.tr,
                    color: Colors.green.shade700,
                    onTap: () {
                      Get.toNamed("reporting");
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.track_changes,
                    title: 'report_tracking'.tr,
                    color: Colors.orange.shade700,
                    onTap: () {
                      Get.toNamed("tracking");
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.balance,
                    title: 'law_info'.tr,
                    color: Colors.purple.shade700,
                    onTap: () {
                      Get.toNamed("law_info");
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.info_outline,
                    title: 'info'.tr,
                    color: Colors.red.shade700,
                    onTap: () {
                      Get.toNamed("info");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            themectrl.selectedTheme.value == AppTheme.dark
                ? Colors.grey.shade800
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with gradient
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kmaincolor, const Color.fromARGB(255, 172, 19, 57)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                // Background pattern
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'lib/core/assets/images/app_logo/pnglogo1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'supported_product'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'explore_supported_products'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'what_are_the_supported_product'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white
                            : Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'supported_product_introduction'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        themectrl.selectedTheme.value == AppTheme.dark
                            ? Colors.white70
                            : Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("products");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 172, 19, 57),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('explore_products'.tr),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color:
                themectrl.selectedTheme.value == AppTheme.dark
                    ? Colors.grey.shade800
                    : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      themectrl.selectedTheme.value == AppTheme.dark
                          ? Colors.white
                          : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
