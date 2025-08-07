import 'package:get/get.dart';
import 'features/view/auth/login%20page/loginpage.dart';
import 'features/view/auth/signin%20page/signin_page.dart';
import 'features/view/auth/reset_password/reset_password_page.dart';
import 'features/view/home/home_page.dart';
import 'features/view/home/pages/help%20and%20fedback/help_and_fedback.dart';
import 'features/view/home/pages/info/info.dart';
import 'features/view/home/pages/law%20info/lawinfo.dart';
import 'features/view/home/pages/products/products.dart';
import 'features/view/home/pages/tarcking/report_tracking.dart';
import 'features/view/home/pages/reporting/report_informations_page.dart';
import 'features/view/home/pages/reporting/reporting.dart';
import 'features/view/home/pages/tarcking/tracking_detail.dart';

class Myrouts {
  static List<GetPage<dynamic>> get getpages {
    return [
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(name: "/signin", page: () => SigninPage()),
      GetPage(name: "/reset-password", page: () => const ResetPasswordPage()),
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/products", page: () => Products()),
      GetPage(name: "/reporting", page: () => Reporting()),
      GetPage(name: "/tracking", page: () => ReportTracking()),
      GetPage(name: "/law_info", page: () => Lawinfo()),
      GetPage(name: "/info", page: () => Info()),
      GetPage(name: "/help", page: () => Helpandfedback()),
      GetPage(
        name: "/report_information",
        page: () => ReportInformationsPage(reportId: Get.arguments),
      ),
      GetPage(
        name: "/report_details",
        page: () => TrackingDetail(reportId: Get.arguments),
      ),
    ];
  }
}
