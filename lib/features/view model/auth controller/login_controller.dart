import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final _googleSignIn = GoogleSignIn();
  final _supabase = Supabase.instance.client;

  // Add these controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailfnode = FocusNode();
  final passwordfnode = FocusNode();

  void unfocusKeyboard() {
    // This will remove focus from any text field and dismiss the keyboard
    emailfnode.unfocus();
    passwordfnode.unfocus();
  }

  // Observable states
  final isLoading = false.obs;
  final isAuthenticated = false.obs;
  final user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    _supabase.auth.onAuthStateChange.listen((event) {
      user.value = event.session?.user;
      isAuthenticated.value = user.value != null;
    });
  }

  // Add observable for password visibility
  final RxBool _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;
  // Add toggle function
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update(); // Notify GetX to update the UI
  }

  // Email & Password Login
  Future<void> signIn(String email, String password) async {
    try {
      // Basic validation
      if (email.isEmpty || password.isEmpty) {
        throw 'Please enter both email and password';
      }

      // Email format validation
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(email)) {
        throw 'Please enter a valid email address';
      }

      isLoading.value = true;
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        emailController.clear();
        passwordController.clear();
        Get.offAllNamed('/home');
      } else {
        throw 'Login failed. Please try again.';
      }
    } catch (e) {
      String errorMessage;

      // Handle specific error cases
      if (e.toString().contains('Invalid login credentials')) {
        errorMessage = 'Incorrect email or password';
      } else if (e.toString().contains('not confirmed')) {
        errorMessage = 'Please verify your email first';
      } else {
        errorMessage = e.toString();
      }

      Get.snackbar(
        'Login Failed',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Reset Password
  Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }

    isLoading.value = true;
    try {
      await _supabase.auth.resetPasswordForEmail(
        emailController.text,
        redirectTo: 'com.trade.lawe://auth-callback/#type=recovery',
      );
      Get.snackbar('Success', 'Password reset email sent! Check your inbox.');
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _supabase.auth.signOut();
      await _googleSignIn.signOut();
      Get.offAllNamed('/login');
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // Clean up focus nodes
    emailController.dispose();
    passwordController.dispose();
    emailfnode.dispose();
    passwordfnode.dispose();
    super.onClose();
  }
}
