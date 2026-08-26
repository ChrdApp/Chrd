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

Future<List<dynamic>?> uploadFilesToSupabase(
  BuildContext context,
  FFUploadedFile? videoFile,
  FFUploadedFile? imageFile,
  FFUploadedFile? thumbnailFile,
  String bucketName,
  String folderPath,
) async {
  // Add your function code here!

  final supabase = Supabase.instance.client;

  String? videoUrl;
  String? imageUrl;
  String? thumbnailUrl;

  // -------- Upload Video --------
  if (videoFile != null && videoFile.bytes != null) {
    final name =
        "video_${DateTime.now().millisecondsSinceEpoch}_${videoFile.name}";
    final res = await supabase.storage.from(bucketName).uploadBinary(
        name, videoFile.bytes!,
        fileOptions: const FileOptions(upsert: true));

    if (res.isNotEmpty) {
      videoUrl = supabase.storage.from(bucketName).getPublicUrl(name);
    }
  }

  // -------- Upload Image --------
  if (imageFile != null && imageFile.bytes != null) {
    final name =
        "image_${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}";
    final res = await supabase.storage.from(bucketName).uploadBinary(
        name, imageFile.bytes!,
        fileOptions: const FileOptions(upsert: true));

    if (res.isNotEmpty) {
      imageUrl = supabase.storage.from(bucketName).getPublicUrl(name);
    }
  }

  // -------- Upload Thumbnail --------
  if (thumbnailFile != null && thumbnailFile.bytes != null) {
    final name =
        "thumb_${DateTime.now().millisecondsSinceEpoch}_${thumbnailFile.name}";
    final res = await supabase.storage.from(bucketName).uploadBinary(
        name, thumbnailFile.bytes!,
        fileOptions: const FileOptions(upsert: true));

    if (res.isNotEmpty) {
      thumbnailUrl = supabase.storage.from(bucketName).getPublicUrl(name);
    }
  }

  return [
    videoUrl, // index 0
    imageUrl, // index 1
    thumbnailUrl, // index 2
  ];
}
