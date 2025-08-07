import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Utils/constants.dart';
import '../../../../../core/Utils/size_config.dart';
import '../../../../view%20model/auth%20controller/anonymous_login.dart';
import '../../../../view%20model/auth%20controller/google_login_cntroller.dart';
import '../../../../view%20model/auth%20controller/login_controller.dart';
import '../../../../view%20model/auth%20controller/textvalidatecontroller.dart';
import '../../../../view%20model/settings%20controllers/theme_controller.dart';
import '../../signin%20page/signin_page.dart';

class LoginBody extends StatelessWidget {
  final ThemeController themeController;
  LoginBody({super.key, required this.themeController});
  final LoginController _loginctrl = Get.find();
  final GoogleLoginCntroller _googleLoginCntroller = Get.put(
    GoogleLoginCntroller(),
  );
  final AnonymousLoginController _anonymousLoginCntroller = Get.put(
    AnonymousLoginController(),
  );
  final Txtvalcontroller _txtvalctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    // استخدم themeController.isDarkMode بدلاً من Get.isDarkMode
    bool isDark = themeController.isDarkMode;

    // String? email = _loginctrl.emailController.text;
    // String? password = _loginctrl.passwordController.text;

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
                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "lib/core/assets/images/app_logo/newlogo.jpg",
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Welcome Text
                Center(
                  child: Text(
                    "welcome_back".tr,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "see_you_again".tr,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.06),

                // Email Field
                Form(
                  key: _txtvalctrl.loginemailstate,
                  child: _buildTextField(
                    controller: _loginctrl.emailController,
                    hintText: "enter_email".tr,
                    focusNode: _loginctrl.emailfnode,
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        (val) =>
                            val!.isEmpty ? "Please ${"enter_email".tr}" : null,
                  ),
                ),

                SizedBox(height: 16),

                // Password Field
                Form(
                  key: _txtvalctrl.loginpasswordstate,
                  child: GetBuilder<LoginController>(
                    builder:
                        (controller) => _buildTextField(
                          controller: _loginctrl.passwordController,
                          hintText: "enter_password".tr,
                          focusNode: _loginctrl.passwordfnode,
                          obscureText: _loginctrl.isPasswordVisible,
                          validator:
                              (val) =>
                                  val!.isEmpty
                                      ? "Please ${"enter_password".tr}"
                                      : null,
                          suffixIcon: IconButton(
                            onPressed: _loginctrl.togglePasswordVisibility,
                            icon: Icon(
                              _loginctrl.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: isDark ? kmaincolor4 : kmaincolor,
                            ),
                          ),
                        ),
                  ),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      _loginctrl.unfocusKeyboard();
                      // Remove the parameter since resetPassword() doesn't accept any
                      _loginctrl.resetPassword();
                    },
                    child: Text(
                      "forgot_password".tr,
                      style: TextStyle(
                        color: isDark ? kmaincolor4 : kmaincolor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.03),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? kmaincolor4 : kmaincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      String email = _loginctrl.emailController.text.trim();
                      String password =
                          _loginctrl.passwordController.text.trim();
                      bool ispassvalidate =
                          _txtvalctrl.loginpasswordstate.currentState!
                              .validate();
                      bool isemailvalidate =
                          _txtvalctrl.loginemailstate.currentState!.validate();
                      bool isloading = _loginctrl.isLoading.value;

                      if (isemailvalidate && ispassvalidate) {
                        isloading ? null : _loginctrl.unfocusKeyboard();
                        isloading ? null : _loginctrl.signIn(email, password);
                      }
                    },
                    child: Obx(
                      () =>
                          _loginctrl.isLoading.value
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isDark ? kmaincolor : kmaincolor4,
                                ),
                              )
                              : Text(
                                "login".tr,
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

                // Or Login with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "or_login_with".tr,
                        style: TextStyle(
                          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
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
                      onTap: () => _googleLoginCntroller.signInWithGoogle(),
                    ),
                    SizedBox(width: 20),
                    _buildSocialLoginButton(
                      icon: "lib/core/assets/images/login_images/Guest.png",
                      iconcolor: isDark ? Colors.white : Colors.black,
                      onTap: () => _anonymousLoginCntroller.signInAnonymously(),
                    ),
                  ],
                ),

                SizedBox(height: Sizeconfig.screenheight! * 0.04),

                // Don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "no_account".tr,
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _loginctrl.unfocusKeyboard();
                        Get.offAll(
                          () => SigninPage(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Text(
                        "sign_in".tr,
                        style: TextStyle(
                          color: isDark ? kmaincolor4 : kmaincolor,
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

  // New method for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    final ThemeController themctrl = Get.find();
    bool isDark = themctrl.isDarkMode;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isDark ? Colors.grey[400] : Colors.grey[500],
        ),
        filled: true,
        fillColor:
            isDark
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

  // New method for social login buttons
  Widget _buildSocialLoginButton({
    required String icon,
    Color? iconcolor,
    required VoidCallback onTap,
  }) {
    final ThemeController themctrl = Get.find();
    bool isDark = themctrl.isDarkMode;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Center(
          child: Image.asset(icon, height: 30, width: 30, color: iconcolor),
        ),
      ),
    );
  }
}
