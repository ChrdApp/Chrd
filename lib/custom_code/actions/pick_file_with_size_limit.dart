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
import 'package:file_picker/file_picker.dart';

Future<FFUploadedFile?> pickFileWithSizeLimit(
  double maxSizeMB,
  String fileType, // "image" or "video"
) async {
  try {
    FileType pickerType;

    // ✅ IMPORTANT FIX FOR iOS
    if (fileType.toLowerCase() == 'video') {
      // Allows BOTH images & videos on iOS
      pickerType = FileType.media;
    } else {
      pickerType = FileType.image;
    }

    final result = await FilePicker.platform.pickFiles(
      type: pickerType,
      withData: true, // required for FlutterFlow & web
    );

    if (result == null || result.files.isEmpty) {
      return null; // User cancelled
    }

    final file = result.files.first;
    final fileBytes = file.bytes;
    final filePath = file.path;

    double sizeMB;

    if (fileBytes != null) {
      sizeMB = fileBytes.lengthInBytes / (1024 * 1024);
    } else if (filePath != null) {
      final f = File(filePath);
      sizeMB = (await f.length()) / (1024 * 1024);
    } else {
      return null;
    }

    if (sizeMB > maxSizeMB) {
      print('❌ File too large: ${sizeMB.toStringAsFixed(2)} MB');
      return null;
    }

    print('✅ File accepted: ${file.name} (${sizeMB.toStringAsFixed(2)} MB)');

    return FFUploadedFile(
      name: file.name,
      bytes: fileBytes,
      height: null,
      width: null,
      blurHash: null,
    );
  } catch (e) {
    print('❌ Error picking file: $e');
    return null;
  }
}
