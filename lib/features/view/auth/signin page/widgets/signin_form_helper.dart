import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/information_form.dart';
import '../../../../view%20model/auth%20controller/signup_controller.dart';
import '../../../../view%20model/auth%20controller/textvalidatecontroller.dart';

// Helper class for sign-in form widgets
class SigninFormHelper {
  // Use Get.find() instead of Get.put()
  final Txtvalcontroller txtvalctrl = Get.find<Txtvalcontroller>();
  final SignupController signinnctrl = Get.find();
  // final Txtvalcontroller txtvalctrl = Get.put<Txtvalcontroller>(
  //   Txtvalcontroller(),
  // );

  // Creates a standard form field with validation
  Widget buildFormField(
    BuildContext context, {
    required String title,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required GlobalKey<FormState> formKey,
    TextInputType? keyboardType,
  }) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: InformationsForm(
        textctrl: controller,
        focusnode: focusNode,
        formtitle: title,
        hint: hint,
        keyboardtype: keyboardType ?? TextInputType.text,
        obsecure: false,
        isrequired: true,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'field_required'.tr;
          }
          if (title == "Email" && !GetUtils.isEmail(val)) {
            return 'valid_email'.tr;
          }
          if (title == "Password" && val.length < 6) {
            return 'password_length'.tr;
          }
          return null;
        },
      ),
    );
  }

  // Creates a password field with visibility toggle and validation
  Widget buildPasswordField(
    BuildContext context, {
    required String title,
    required String hint,
    required bool obsecure,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
    required bool isConfirmation,
  }) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: InformationsForm(
        focusnode:
            isConfirmation
                ? signinnctrl.passwordfnode2
                : signinnctrl.passwordfnode,
        lines: 1,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return isConfirmation
                ? 'Please ${"confirm_password".tr}'
                : 'field_required'.tr;
          }
          if (isConfirmation && val != signinnctrl.password1.text) {
            return 'not_match'.tr;
          }
          return null;
        },
        suffixbutton: IconButton(
          onPressed:
              isConfirmation
                  ? signinnctrl.togglePasswordVisibility2
                  : signinnctrl.togglePasswordVisibility,
          icon: Icon(
            isConfirmation
                ? (signinnctrl.isPasswordVisible2
                    ? Icons.visibility_off
                    : Icons.visibility)
                : (signinnctrl.isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility),
            color: Get.isDarkMode ? Colors.white : const Color(0xFF3D3825),
          ),
        ),
        isrequired: true,
        textctrl: controller,
        formtitle: title,
        hint: hint,
        keyboardtype: TextInputType.emailAddress,
        obsecure: obsecure,
      ),
    );
  }
}
