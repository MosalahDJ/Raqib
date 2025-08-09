import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/Utils/binding.dart';
import 'core/Utils/size_config.dart';
import 'core/localization/translations.dart';
import 'core/theme/thems.dart';
import 'features/view%20model/auth%20controller/deep_link_controller.dart';
import 'features/view%20model/settings%20controllers/language_controller.dart';
import 'features/view%20model/settings%20controllers/theme_controller.dart';
import 'features/view/auth/login%20page/loginpage.dart';
import 'features/view/home/home_page.dart';
import 'myrouts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final String url = dotenv.env['supabaseUrl']!;
  final String anonKey = dotenv.env['supabaseAnonKey']!;

  // Initialize Supabase
  await Supabase.initialize(url: url, anonKey: anonKey);

  final prefs = await SharedPreferences.getInstance();

  // Force portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(Raqib(prefs: prefs));
}

class Raqib extends StatefulWidget {
  const Raqib({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  State<Raqib> createState() => _RaqibState();
}

class _RaqibState extends State<Raqib> {
  @override
  void initState() {
    super.initState();
    // Initialize deep link controller
    Get.put(DeepLinkController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );
    final languageController = Get.put<LanguageController>(
      LanguageController(widget.prefs),
      permanent: true,
    );
    final supabase = Supabase.instance.client;

    return GetMaterialApp(
      title: 'Raqib',
      theme: Themes().lightmode,
      darkTheme: Themes().darkmode,
      themeMode:
          themeController.selectedTheme.value == AppTheme.system
              ? ThemeMode.system
              : themeController.selectedTheme.value == AppTheme.light
              ? ThemeMode.light
              : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: Mybinding(),
      home:
          supabase.auth.currentSession == null ? LoginPage() : const HomePage(),
      getPages: Myrouts.getpages,
      translations: Messages(),
      locale: Locale(languageController.language.value),
      fallbackLocale: const Locale('en', 'US'),
      builder: (context, child) {
        Sizeconfig().init(context);
        return child!;
      },
    );
  }
}
