import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class DeepLinkController extends GetxController {
  late AppLinks _appLinks;
  StreamSubscription? _linkSubscription;

  @override
  void onInit() {
    super.onInit();
    _initDeepLinks();
  }

  void _initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle deep links when app is already running
    _linkSubscription = _appLinks.allUriLinkStream.listen(
      (uri) {
        _handleDeepLink(uri.toString());
      },
      onError: (err) {
        // Handle deep link errors silently or log to crash analytics
      },
    );

    // Handle deep link when app is launched from terminated state
    try {
      final initialUri = await _appLinks.getInitialAppLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri.toString());
      }
    } catch (e) {
      // Handle initial link errors silently or log to crash analytics
    }
  }

  void _handleDeepLink(String link) async {
    try {
      final uri = Uri.parse(link);

      // Check if this is an auth callback
      if (uri.host == 'auth-callback' && uri.scheme == 'com.trade.lawe') {
        await _handleAuthCallback(uri);
      }
    } catch (e) {
      _handleDeepLinkError('Failed to process authentication link');
    }
  }

  Future<void> _handleAuthCallback(Uri uri) async {
    try {
      // Extract the type parameter to understand the intent
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      // Use Supabase's built-in method to handle the URL
      final response = await Supabase.instance.client.auth.getSessionFromUrl(
        uri,
      );

      // Log successful session recovery (optional - for debugging)
      final sessionExpiry = response.session.expiresAt;

      // Verify session is not expired
      if (sessionExpiry != null &&
          DateTime.now().millisecondsSinceEpoch > sessionExpiry * 1000) {
        throw AuthException('Session has expired');
      }

      // Navigate based on the type with specific checking
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (type == 'recovery' || uri.path.contains('reset-password')) {
          Get.offAllNamed('/reset-password');
        } else if (type == 'signup' || type == 'invite') {
          Get.toNamed('/login');
        } else {
          Get.toNamed('/login');
        }
      });
    } on AuthException catch (authError) {
      // Check if this is a password reset link even if session recovery failed
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      if (type == 'recovery' || uri.path.contains('reset-password')) {
        // For password reset, navigate even if session recovery failed
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed('/reset-password');
        });
      } else {
        // Handle other auth errors
        if (authError.message.contains('Code verifier') ||
            authError.message.contains('expired')) {
          _handleDeepLinkError(
            'Reset password link has expired. Please request a new one.',
          );
        } else {
          _handleDeepLinkError('Authentication failed: ${authError.message}');
        }
      }
    } catch (e) {
      // Check if this is a password reset link even if there's an unexpected error
      final fragment = uri.fragment;
      final params = Uri.splitQueryString(fragment);
      final type = params['type'];

      if (type == 'recovery' || uri.path.contains('reset-password')) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed('/reset-password');
        });
      } else {
        _handleDeepLinkError('An unexpected error occurred. Please try again.');
      }
    }
  }

  void _handleDeepLinkError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 5),
      );

      // Navigate back to login page
      Get.offAllNamed('/login');
    });
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }
}
