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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<bool> verifyOtp(String otp, String number) async {
  // Add your function code here!
  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;
  try {
    await supabase.auth.verifyOTP(
      type: OtpType.sms,
      token: otp,
      phone: number,
    );
    return true;
  } catch (error) {
    return false;
  }
}
