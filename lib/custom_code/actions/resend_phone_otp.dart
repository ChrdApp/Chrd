// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> resendPhoneOtp(String? number) async {
  // Add your function code here!
  try {
    await Supabase.instance.client.auth.signInWithOtp(phone: number);
    return 'OTP sent successfully.';
  } on AuthException catch (e) {
    if (e.statusCode == '429') {
      // "For security purposes, you can only request this after 47 seconds."
      final match = RegExp(r'(\d+)\s*seconds').firstMatch(e.message);
      final secs = match?.group(1);
      return secs != null
          ? 'Please wait $secs seconds before requesting another code.'
          : 'Too many requests. Please wait a moment.';
    }
    return e.message;
  } catch (e) {
    return 'Network error. Check your connection.';
  }
}
