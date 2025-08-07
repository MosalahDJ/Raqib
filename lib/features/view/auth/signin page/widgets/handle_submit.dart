import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view%20model/auth%20controller/login_controller.dart';
import '../../../../view%20model/auth%20controller/signup_controller.dart';
import '../../../../view%20model/auth%20controller/textvalidatecontroller.dart';

class SignInSubmitHandler {
  SignupController signinctrl = Get.put<SignupController>(SignupController());
LoginController loginctrl = Get.find<LoginController>();
  Txtvalcontroller txtvalctrl = Get.find<Txtvalcontroller>();

    void handleSubmit(BuildContext context) {
      signinctrl.unfocuskeyboardsignin();
  
      // Validate all forms
      bool isValid =
          txtvalctrl.signinnamestate.currentState!.validate() &&
          txtvalctrl.signinlastnamestate.currentState!.validate() &&
          txtvalctrl.signingendrestate.currentState!.validate() &&
          txtvalctrl.signinemailstate.currentState!.validate() &&
          txtvalctrl.signinpasswordstate.currentState!.validate() &&
          txtvalctrl.signinpasswordstate2.currentState!.validate();
  
      if (isValid) {
        signinctrl.signUpWithEmail(
          loginctrl.emailController.text,
          loginctrl.passwordController.text,
        );
      }
    }
  }
