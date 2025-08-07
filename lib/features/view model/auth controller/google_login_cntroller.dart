import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleLoginCntroller extends GetxController {
  // Add your Google login logic here
  // For example, you can use the GoogleSignIn package to handle Google authentication
  final isLoading = false.obs;
  final _supabase = Supabase.instance.client;
  // Example method to initiate Google sign-in

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Configure Google Sign In with your web client ID
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            '524401420622-bslevq000brf9705snlk0v1sso8nk6ot.apps.googleusercontent.com', // Add your web client ID here
        scopes: ['email', 'profile'],
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken,
      );

      if (response.user != null) {
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to sign in with Google: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
