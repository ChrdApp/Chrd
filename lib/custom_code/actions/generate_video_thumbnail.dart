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

import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<FFUploadedFile?> generateVideoThumbnail(FFUploadedFile videoFile) async {
  //
  // ❗ Web does NOT support video_thumbnail or dart:io
  //
  if (kIsWeb) {
    print("⚠️ Thumbnail generation not supported on Web.");
    return null;
  }

  try {
    print('🎬 Starting thumbnail generation...');

    if (videoFile.bytes == null || videoFile.bytes!.isEmpty) {
      print('❌ Error: video has no bytes.');
      return null;
    }

    final tempDir = Directory.systemTemp;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final videoPath = '${tempDir.path}/temp_video_$timestamp.mp4';

    final videoTemp = File(videoPath);
    await videoTemp.writeAsBytes(videoFile.bytes!);

    print("📁 Video saved: $videoPath");

    // Generate thumbnail from native plugin
    final thumbPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 512,
      quality: 90,
      timeMs: 1000,
    );

    // Cleanup video file
    await videoTemp.delete();

    if (thumbPath == null) {
      print("❌ video_thumbnail returned null");
      return null;
    }

    print("🖼️ Thumbnail saved: $thumbPath");

    final thumbFile = File(thumbPath);
    final bytes = await thumbFile.readAsBytes();

    // Cleanup thumbnail file
    await thumbFile.delete();

    return FFUploadedFile(
      name: "thumbnail_${videoFile.name ?? 'video'}.jpg",
      bytes: bytes,
    );
  } catch (e, st) {
    print("❌ ERROR generating thumbnail: $e");
    print(st);
    return null;
  }
}
