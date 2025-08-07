import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnonymousLoginController extends GetxController {
  final _supabase = Supabase.instance.client;

  // Observable for loading state
  final isLoading = false.obs;

  // Method to sign in anonymously
  // Anonymous Login
  Future<void> signInAnonymously() async {
    try {
      isLoading.value = true;
      final response = await _supabase.auth.signInAnonymously();
      if (response.user != null) {
        Get.offAllNamed('/home');
      }
    } catch (e) {
      isLoading.value = false;

      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
