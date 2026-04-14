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

import 'index.dart'; // Imports other custom actions

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '/flutter_flow/upload_data.dart';

Future<List<FFUploadedFile>> pickVideoImageAndThumbnail(
    BuildContext context) async {
  final selectedMedia = await selectMediaWithSourceBottomSheet(
    context: context,
    allowPhoto: true,
    allowVideo: true,
  );

  if (selectedMedia == null || selectedMedia.isEmpty) {
    return [];
  }

  FFUploadedFile? videoFile;
  FFUploadedFile? imageFile;
  FFUploadedFile? thumbnailFile;

  for (final media in selectedMedia) {
    final file = FFUploadedFile(
      name: media.storagePath.split('/').last,
      bytes: media.bytes,
      height: media.dimensions?.height,
      width: media.dimensions?.width,
      blurHash: media.blurHash,
      originalFilename: media.originalFilename,
    );

    final path = media.storagePath.toLowerCase();
    final bool isVideo = path.endsWith('.mp4') ||
        path.endsWith('.mov') ||
        path.endsWith('.avi') ||
        path.endsWith('.mkv') ||
        path.endsWith('.webm');

    if (isVideo) {
      videoFile = file;

      // 🔽 Write video bytes to temp file
      final tempDir = await getTemporaryDirectory();
      final tempVideoFile = File(
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4',
      );
      await tempVideoFile.writeAsBytes(media.bytes);

      final thumbBytes = await VideoThumbnail.thumbnailData(
        video: tempVideoFile.path, // ✅ real readable file
        imageFormat: ImageFormat.PNG,
        maxWidth: 512,
        quality: 80,
      );

      if (thumbBytes != null) {
        thumbnailFile = FFUploadedFile(
          name: 'thumb_${DateTime.now().millisecondsSinceEpoch}.png',
          bytes: thumbBytes,
        );
      }
    } else {
      imageFile = file;
    }
  }

  if (videoFile == null && imageFile != null) {
    return [imageFile];
  }

  if (thumbnailFile != null && videoFile != null) {
    return [thumbnailFile, videoFile];
  }

  return [];
}
