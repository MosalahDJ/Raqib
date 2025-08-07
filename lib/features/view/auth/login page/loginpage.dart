import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../view%20model/settings%20controllers/theme_controller.dart';
import '../login%20page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.find() instead of Get.put() to get existing instance
    // or Get.lazyPut() to create only if doesn't exist
    // final Txtvalcontroller txtvalctrl = Get.find<Txtvalcontroller>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool shouldPop =
              await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('are_you_sure'.tr),
                      content: Text('leave_login'.tr),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('no'.tr),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('yes'.tr),
                        ),
                      ],
                    ),
              ) ??
              false;
          if (shouldPop) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        body: GetBuilder<ThemeController>(
          builder:
              (themeController) => LoginBody(themeController: themeController),
        ),
      ),
    );
  }
}
