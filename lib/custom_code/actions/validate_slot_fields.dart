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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
String validateSlotFields(
  DateTime? startDate,
  DateTime? startTime,
  DateTime? endTime,
  DateTime? loadTime,
  String? loadDuration,
  int? stage,
) {
  final fields = {
    'Start Date': startDate,
    'Start Time': startTime,
    'End Time': endTime,
    'Load Time': loadTime,
    'Load Duration': loadDuration,
    'Stage': stage,
  };

  for (final entry in fields.entries) {
    final value = entry.value;
    if (value == null || (value is String && value.trim().isEmpty)) {
      return 'Please fill out ${entry.key}.';
    }
  }

  return 'success';
}
