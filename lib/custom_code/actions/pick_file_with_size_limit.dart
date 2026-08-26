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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mime_type/mime_type.dart';

/// Returns the picked file on success, or null on failure.
/// On failure, [errorMessage] app state is updated with the reason.
///
/// Error messages set in FFAppState().errorMessage:
///   - "No file selected"
///   - "File size exceeds {maxSizeMB} MB limit. Your file is {actualSize} MB."
///   - "Unsupported file format. Please select a JPG, PNG, GIF, or WEBP image."
///   - "Unsupported video format. Please select an MP4, MOV, or AVI video."
///   - "Could not read the selected file. Please try again."
///   - "Something went wrong. Please try again."
Future<FFUploadedFile?> pickFileWithSizeLimit(
  BuildContext context,
  double maxSizeMB,
  String fileType,
) async {
  // Clear any previous error
  FFAppState().errorMessage = '';

  try {
    FileType pickerType;

    if (fileType.toLowerCase() == 'video') {
      pickerType = FileType.media;
    } else {
      pickerType = FileType.image;
    }

    final result = await FilePicker.platform.pickFiles(
      type: pickerType,
      withData: kIsWeb,
    );

    if (result == null || result.files.isEmpty) {
      FFAppState().errorMessage = 'No file selected';
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
      FFAppState().errorMessage =
          'Could not read the selected file. Please try again.';
      return null;
    }

    // --- Format check ---
    String fileName = file.name.toLowerCase();
    final String? mimeType = mime(fileName);

    if (fileType.toLowerCase() == 'video') {
      final allowedVideoMimes = [
        'video/mp4',
        'video/quicktime',
        'video/x-msvideo',
        'video/mpeg',
        'video/webm',
      ];
      if (mimeType == null || !allowedVideoMimes.contains(mimeType)) {
        FFAppState().errorMessage =
            'Unsupported video format. Please select an MP4, MOV, or AVI video.';
        return null;
      }
    } else {
      final allowedImageMimes = [
        'image/jpeg',
        'image/png',
        'image/gif',
        'image/webp',
        'image/heic',
        'image/heif',
      ];
      if (mimeType == null || !allowedImageMimes.contains(mimeType)) {
        FFAppState().errorMessage =
            'Unsupported file format. Please select a JPG, PNG, GIF, or WEBP image.';
        return null;
      }
    }

    // --- Size check ---
    final double sizeMB = fileBytes.lengthInBytes / (1024 * 1024);
    if (sizeMB > maxSizeMB) {
      FFAppState().errorMessage =
          'File size exceeds ${maxSizeMB.toStringAsFixed(0)} MB limit. Your file is ${sizeMB.toStringAsFixed(1)} MB.';
      return null;
    }

    // --- Build a safe file name with extension ---
    fileName = file.name; // reset to original casing

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
    FFAppState().errorMessage = 'Something went wrong. Please try again.';
    return null;
  }
}
