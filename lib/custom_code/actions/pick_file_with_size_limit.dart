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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mime_type/mime_type.dart';

Future<FFUploadedFile?> pickFileWithSizeLimit(
  double maxSizeMB,
  String fileType,
) async {
  try {
    FileType pickerType;

    if (fileType.toLowerCase() == 'video') {
      pickerType = FileType.media;
    } else {
      pickerType = FileType.image;
    }

    final result = await FilePicker.platform.pickFiles(
      type: pickerType,
      withData: kIsWeb, // only force bytes on web; on native we read from path
    );

    if (result == null || result.files.isEmpty) {
      return null;
    }

    final file = result.files.first;
    Uint8List? fileBytes = file.bytes;
    final filePath = file.path;

    // --- Ensure we have bytes (iOS/Android fallback) ---
    if (fileBytes == null && filePath != null && !kIsWeb) {
      final f = File(filePath);
      if (await f.exists()) {
        fileBytes = await f.readAsBytes();
      }
    }

    if (fileBytes == null) {
      return null;
    }

    // --- Size check ---
    final double sizeMB = fileBytes.lengthInBytes / (1024 * 1024);
    if (sizeMB > maxSizeMB) {
      return null;
    }

    // --- Build a safe file name with extension ---
    String fileName = file.name;

    // iOS sometimes gives names without extensions; fix that
    if (!fileName.contains('.') && filePath != null) {
      final ext = filePath.split('.').last;
      if (ext.isNotEmpty && ext.length <= 5) {
        fileName = '$fileName.$ext';
      }
    }

    return FFUploadedFile(
      name: fileName,
      bytes: fileBytes,
      height: null,
      width: null,
      blurHash: null,
    );
  } catch (e) {
    return null;
  }
}
