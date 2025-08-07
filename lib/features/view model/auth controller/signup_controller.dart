import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  final _supabase = Supabase.instance.client;

  // Observable states
  final isLoading = false.obs;
  final isAuthenticated = false.obs;
  final user = Rxn<User>();

  // Add observable for password visibility
  final RxBool _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

  // Add toggle function
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update(); // Notify GetX to update the UI
  }

  // Add observable for password visibility
  final RxBool _isPasswordVisible2 = false.obs;
  bool get isPasswordVisible2 => _isPasswordVisible2.value;

  // Add toggle function
  void togglePasswordVisibility2() {
    _isPasswordVisible2.value = !_isPasswordVisible2.value;
    update(); // Notify GetX to update the UI
  }

  // Text Controllers for sign-in form
  final name = TextEditingController();
  final lastName = TextEditingController();
  final myemail = TextEditingController();
  final password1 = TextEditingController();
  final password2 = TextEditingController();
  final gender = TextEditingController();

  // Focus Nodes for sign-in form
  final namefnode = FocusNode();
  final lastNamefnode = FocusNode();
  final genderfnode = FocusNode();
  final emailfnode = FocusNode();
  final passwordfnode = FocusNode();
  final passwordfnode2 = FocusNode();

  // Add the unfocuskeyboardsignin method
  void unfocuskeyboardsignin() {
    namefnode.unfocus();
    lastNamefnode.unfocus();
    genderfnode.unfocus();
    emailfnode.unfocus();
    passwordfnode.unfocus();
    passwordfnode2.unfocus();
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      isLoading.value = true;

      // Sign up the user
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'com.trade.lawe://auth-callback/',
        data: {
          'name': name.text,
          'lastName': lastName.text,
          'gender': gender.text,
        },
      );

      if (response.user != null) {
        if (response.session == null) {
          // Email confirmation was sent
          Get.snackbar(
            'Success',
            'Please check your email for verification link',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5),
          );

          // Clear form fields
          name.clear();
          lastName.clear();
          myemail.clear();
          password1.clear();
          password2.clear();
          gender.clear();

          Get.offAllNamed('/login');
        } else {
          // User doesn't need email confirmation
          Get.snackbar(
            'Success',
            'Account created successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offAllNamed('/home');
        }
      }
    } catch (e) {

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose text controllers
    name.dispose();
    lastName.dispose();
    myemail.dispose();
    password1.dispose();
    password2.dispose();
    // Clean up focus nodes
    namefnode.dispose();
    lastNamefnode.dispose();
    genderfnode.dispose();
    emailfnode.dispose();
    passwordfnode.dispose();
    super.onClose();
  }
}
