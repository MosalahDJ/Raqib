import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import '../../../../../core/Utils/size_config.dart';
import '../../../../view%20model/auth%20controller/anonymous_login.dart';
import '../../../../view%20model/auth%20controller/google_login_cntroller.dart';
import '../../../../view%20model/auth%20controller/signup_controller.dart';
import '../../../../view%20model/auth%20controller/textvalidatecontroller.dart';
import '../../login%20page/loginpage.dart';

class SigneinPageBody extends StatelessWidget {
  SigneinPageBody({super.key});

  final SignupController signinctrl = Get.find();
  final Txtvalcontroller txtvalctrl = Get.find();

  final GoogleLoginCntroller _googleLoginCntroller = Get.put(
    GoogleLoginCntroller(),
  );
  final AnonymousLoginController _anonymousLoginCntroller = Get.put(
    AnonymousLoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizeconfig.screenwidth! * 0.06,
              vertical: Sizeconfig.screenheight! * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          Get.isDarkMode
                              ? Colors.grey[700]!
                              : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Get.isDarkMode ? Colors.white : Colors.black87,
                      size: 20,
                    ),
                    onPressed: () {
                      signinctrl.unfocuskeyboardsignin();
                      Get.offAll(
                        () => LoginPage(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.leftToRight,
                      );
                    },
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Welcome Text
                Text(
                  "hello_register".tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "started".tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.05),

                // Username Field
                Form(
                  key: txtvalctrl.signinnamestate,
                  child: _buildTextField(
                    controller: signinctrl.name,
                    hintText: "first_name".tr,
                    focusNode: signinctrl.namefnode,
                    validator:
                        (val) => val!.isEmpty ? "enter_first_name".tr : null,
                  ),
                ),

                SizedBox(height: 16),

                // Email Field
                Form(
                  key: txtvalctrl.signinemailstate,
                  child: _buildTextField(
                    controller: signinctrl.myemail,
                    hintText: "email".tr,
                    focusNode: signinctrl.emailfnode,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter_email".tr;
                      }
                      // Email format validation
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(val)) {
                        return "invalid_email_format".tr;
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 16),

                // Password Field
                Form(
                  key: txtvalctrl.signinpasswordstate,
                  child: GetBuilder<SignupController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: signinctrl.password1,
                          hintText: "password".tr,
                          focusNode: signinctrl.passwordfnode,
                          obscureText: signinctrl.isPasswordVisible,
                          validator:
                              (val) =>
                                  val!.isEmpty ? "enter_password".tr : null,
                          suffixIcon: IconButton(
                            onPressed: signinctrl.togglePasswordVisibility,
                            icon: Icon(
                              signinctrl.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                SizedBox(height: 16),

                // Confirm Password Field
                Form(
                  key: txtvalctrl.signinpasswordstate2,
                  child: GetBuilder<SignupController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: signinctrl.password2,
                          hintText: "confirm_password".tr,
                          focusNode: signinctrl.passwordfnode2,
                          obscureText: signinctrl.isPasswordVisible2,
                          validator:
                              (val) =>
                                  val!.isEmpty
                                      ? "enter_confirm_password".tr
                                      : null,
                          suffixIcon: IconButton(
                            onPressed: signinctrl.togglePasswordVisibility2,
                            icon: Icon(
                              signinctrl.isPasswordVisible2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? kmaincolor4 : kmaincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      signinctrl.unfocuskeyboardsignin();
                      if (validateForms()) {
                        signinctrl.isLoading.value
                            ? null
                            : signinctrl.signUpWithEmail(
                              signinctrl.myemail.text,
                              signinctrl.password1.text,
                            );
                      }
                    },
                    child: Obx(
                      () =>
                          signinctrl.isLoading.value
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Get.isDarkMode ? kmaincolor : kmaincolor4,
                                ),
                              )
                              : Text(
                                "register".tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Or Register with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color:
                            Get.isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or_login_with".tr,
                        style: TextStyle(
                          color:
                              Get.isDarkMode
                                  ? Colors.grey[400]!
                                  : Colors.grey[600]!,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color:
                            Get.isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/google.png",
                      onTap: () {
                        _googleLoginCntroller.signInWithGoogle();
                      },
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/Guest.png",
                      onTap: () {
                        _anonymousLoginCntroller.signInAnonymously();
                      },
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have_account".tr,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        signinctrl.unfocuskeyboardsignin();
                        Get.offAll(
                          () => LoginPage(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                        );
                      },
                      child: Text(
                        "log_in".tr,
                        style: TextStyle(
                          color: Get.isDarkMode ? kmaincolor4 : kmaincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateForms() {
    return txtvalctrl.signinnamestate.currentState!.validate() &&
        txtvalctrl.signinemailstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate.currentState!.validate() &&
        txtvalctrl.signinpasswordstate2.currentState!.validate();
  }

  // Text field widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[500],
        ),
        filled: true,
        fillColor:
            Get.isDarkMode
                ? Colors.grey[800]!.withValues(alpha: 0.5)
                : Colors.grey[100]!,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon: suffixIcon,
      ),
    );
  }

  // Social login button widget
  Widget _buildSocialLoginButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Center(child: Image.asset(icon, height: 30, width: 30)),
      ),
    );
  }
}
