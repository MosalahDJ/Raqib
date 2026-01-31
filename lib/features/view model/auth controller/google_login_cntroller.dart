import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleLoginCntroller extends GetxController {
  // signin in with google
  final isLoading = false.obs;
  final _supabase = Supabase.instance.client;
  final String _clientId = dotenv.env['googleOAuthClientId']!;

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Configure Google Sign In with web client ID
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: _clientId,
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
