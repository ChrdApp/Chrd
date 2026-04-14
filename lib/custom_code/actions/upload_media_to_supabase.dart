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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> uploadMediaToSupabase(
  FFUploadedFile fileBytes,
  String bucketName,
  String folderPath,
) async {
  final supabase = Supabase.instance.client;

  if (fileBytes.bytes == null) {
    return "ERROR: File bytes are null";
  }

  final fileName = "${DateTime.now().millisecondsSinceEpoch}_${fileBytes.name}";

  final fullPath = "$folderPath/$fileName";

  await supabase.storage.from(bucketName).uploadBinary(
        fullPath,
        fileBytes.bytes!,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: false,
        ),
      );

  final publicUrl = supabase.storage.from(bucketName).getPublicUrl(fullPath);

  return publicUrl; // ✅ Returning String
}
