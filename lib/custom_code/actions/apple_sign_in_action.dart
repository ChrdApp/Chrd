// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:io';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Apple Sign In Returns Supabase User UUID (String)
Future<String?> appleSignInAction(BuildContext context) async {
  GoRouter.of(context).prepareAuthEvent();
  final supabase = SupaFlow.client;

  try {
    // Check Apple Sign In availability
    if (Platform.isIOS || Platform.isMacOS) {
      final isAvailable = await SignInWithApple.isAvailable();
      if (!isAvailable) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Apple Sign In is not available on this device.'),
          ),
        );
        return null;
      }
    }

    // Request Apple credential
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: Platform.isAndroid
          ? WebAuthenticationOptions(
              clientId: 'com.mycompany.chrd.oauth',
              redirectUri: Uri.parse(
                'https://kasnaqcqfuqnfydsjvpy.supabase.co/auth/v1/callback',
              ),
            )
          : null,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Apple Sign In failed: missing identity token.'),
        ),
      );
      return null;
    }

    // Sign in with Supabase
    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
    );

    final user = response.user;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Apple Sign In failed: no user returned.'),
        ),
      );
      return null;
    }

    // ===============================
    // OPTIONAL USER INFO (SAFE)
    // ===============================

    // Email (Apple may return null)
    if (user.email != null && user.email!.isNotEmpty) {
      FFAppState().email = user.email!;
    }

    // First / Last name (Apple returns only on first login)
    if (credential.givenName != null && credential.givenName!.isNotEmpty) {
      FFAppState().firstName = credential.givenName!;
    }

    if (credential.familyName != null && credential.familyName!.isNotEmpty) {
      FFAppState().lastName = credential.familyName!;
    }

    // ===============================
    // RETURN UUID DIRECTLY
    // ===============================
    return user.id;
  } on SignInWithAppleAuthorizationException catch (e) {
    String errorMessage = 'Apple Sign In failed.';

    switch (e.code) {
      case AuthorizationErrorCode.canceled:
        errorMessage = 'Apple Sign In was cancelled.';
        break;
      case AuthorizationErrorCode.failed:
        errorMessage = 'Apple Sign In failed. Please try again.';
        break;
      case AuthorizationErrorCode.invalidResponse:
        errorMessage = 'Invalid response from Apple. Please try again.';
        break;
      case AuthorizationErrorCode.notHandled:
        errorMessage = 'Apple Sign In not handled properly.';
        break;
      case AuthorizationErrorCode.unknown:
        errorMessage = 'Unknown error occurred during Apple Sign In.';
        break;
      case AuthorizationErrorCode.notInteractive:
        errorMessage = 'Apple Sign In requires user interaction.';
        break;
      case AuthorizationErrorCode.credentialExport:
        errorMessage = 'Could not export Apple credential.';
        break;
      case AuthorizationErrorCode.credentialImport:
        errorMessage = 'Could not import Apple credential.';
        break;
      case AuthorizationErrorCode.matchedExcludedCredential:
        errorMessage = 'This Apple credential is excluded.';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
    return null;
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Apple Sign In failed: ${e.toString()}'),
      ),
    );
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
