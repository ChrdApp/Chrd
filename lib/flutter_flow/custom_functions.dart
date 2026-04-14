import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool? isVideoUrl(String? url) {
  if (url == null) return false;

  final lowerUrl = url.toLowerCase();

  return lowerUrl.endsWith('.mp4') ||
      lowerUrl.endsWith('.mov') ||
      lowerUrl.endsWith('.avi') ||
      lowerUrl.endsWith('.wmv') ||
      lowerUrl.endsWith('.flv') ||
      lowerUrl.endsWith('.mkv') ||
      lowerUrl.endsWith('.webm') ||
      lowerUrl.endsWith('.m4v');
}

bool? isValidMobileNumber(String input) {
  final RegExp mobileRegex = RegExp(r'^\d{10}$');
  return mobileRegex.hasMatch(input);
}

String? getDateDifferenceInDays(DateTime? dateSelected) {
  if (dateSelected == null) return null;

  final now = DateTime.now();

  // Compare only year, month, day
  final today = DateTime(now.year, now.month, now.day);
  final selectedDate =
      DateTime(dateSelected.year, dateSelected.month, dateSelected.day);

  final differenceInDays = selectedDate.difference(today).inDays;
  // ✅ Handle today
  if (differenceInDays == 0) {
    return 'today';
  }

  // ✅ Optional: handle past dates (keep or remove based on your need)
  if (differenceInDays < 0) {
    return 'today'; // or return null if you want to ignore past
  }

  final months = differenceInDays ~/ 30;
  final days = differenceInDays % 30;

  String result = '';

  if (months > 0) {
    result += '$months month${months > 1 ? 's' : ''}';
  }

  if (days > 0) {
    if (result.isNotEmpty) result += ' ';
    result += '$days day${days > 1 ? 's' : ''}';
  }

  return result.trim();
}

String? findTime(
  DateTime? startTime,
  DateTime? endTime,
) {
  if (startTime == null || endTime == null) return null;

  // Adjust endTime if it's less than startTime (next day)
  if (endTime.isBefore(startTime)) {
    endTime = endTime.add(Duration(days: 1));
  }

  Duration difference = endTime.difference(startTime);

  // Format the difference
  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);

  // Return formatted string
  return '${hours > 0 ? hours.toString() + ' hours ' : ''}${minutes} minutes';
}

/// return tomorrow date
DateTime? tomorrowsDate() {
  final now = DateTime.now();
  return now.add(Duration(days: 1));
}

List<String>? extractMobileNo(String number) {
  String digitsOnly = number.replaceAll(RegExp(r'[^0-9]'), '');
  String countryCode = digitsOnly[0];
  String mobileNo = digitsOnly.substring(1, digitsOnly.length);

  return [mobileNo, countryCode];
}

String? formatUSNumber(String? number) {
  if (number == null || number.isEmpty) return '';
  String digits = number.replaceAll(RegExp(r'[^0-9]'), '');

  // Ensure it's at least 10 digits
  if (digits.length != 10) {
    throw FormatException('Input must be a 10-digit number');
  }

  // Format into +1 (XXX) XXX-XXXX
  return '+1 (${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6, 10)}';
}

int getHourFromDateTime(DateTime? dateTime) {
  // Check if dateTime is null
  if (dateTime == null) {
    return 0; // Default value
  }

  // Return the hour (0-23 format)
  return dateTime.hour;
}

DateTime? addThreeMonths(DateTime dateTime) {
  // Add 3 months to the passed DateTime
  return DateTime(
    dateTime.year,
    dateTime.month + 3,
    dateTime.day,
    dateTime.hour,
    dateTime.minute,
    dateTime.second,
    dateTime.millisecond,
    dateTime.microsecond,
  );
}

int getMinuteFromDateTime(DateTime? inputTime) {
  // Check if dateTime is null
  if (inputTime == null) {
    return 0; // Default value
  }

  // Return the hour (0-23 format)
  return inputTime.minute;
}

List<String>? intListToStringList(List<int> intList) {
  return intList.map((e) => e.toString()).toList();
}

List<int>? stringListToIntList(List<String> stringList) {
  return stringList.map((e) => int.tryParse(e) ?? 0).toList();
}

List<String> removeFirstIndex(List<String> value) {
  if (value.isNotEmpty) {
    value.removeAt(0);
  }
  return value;
}

String formatTime(String dateString) {
  if (dateString.isEmpty) return '';

  // Replace space with 'T' to make it ISO-8601 compatible
  final isoString = dateString.replaceFirst(' ', 'T');

  // Parse DateTime (handles timezone)
  final DateTime messageTime = DateTime.parse(isoString).toLocal();

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final msgDate =
      DateTime(messageTime.year, messageTime.month, messageTime.day);
  final difference = today.difference(msgDate).inDays;

  String formatTimeOnly(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    if (hour == 0) hour = 12;
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hour:$minuteStr $period';
  }

  String formatDate(DateTime date) {
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String year = date.year.toString().substring(2);
    return '$month/$day/$year';
  }

  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  if (difference == 0) {
    return formatTimeOnly(messageTime);
  } else if (difference == 1) {
    return 'Yesterday';
  } else if (difference < 7) {
    return weekdays[messageTime.weekday - 1];
  } else {
    return formatDate(messageTime);
  }
}

bool isInvalidUsername(String value) {
  final v = value.trim();

  // Empty is invalid
  if (v.isEmpty) return false;

  // If value contains a dot and looks like a domain → invalid
  final domainRegex = RegExp(
    r'^(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(/.*)?$',
    caseSensitive: false,
  );
  if (domainRegex.hasMatch(v)) {
    return true;
  }

  // If value is a URL with scheme → invalid
  final uri = Uri.tryParse(v);
  if (uri != null && uri.hasScheme && uri.hasAuthority) {
    return true;
  }

  // Only allow valid username characters
  final usernameRegex = RegExp(r'^[a-zA-Z0-9._-]{1,30}$');

  // If it does NOT match → invalid (true), else valid (false)
  return !usernameRegex.hasMatch(v);
}

dynamic splitNameToJson(String value) {
  final v = value.trim();

  if (v.isEmpty) {
    return {
      "firstname": "",
      "lastname": "",
    };
  }

  final parts = v.split(RegExp(r'\s+'));

  final firstName = parts.isNotEmpty ? parts.first : "";
  final lastName = parts.length > 1 ? parts.sublist(1).join(" ") : "";

  return {
    "firstname": firstName,
    "lastname": lastName,
  };
}

dynamic addStaticFirstItem(dynamic inputJson) {
  const String firstItem = "firstItem";

  // If null → treat as empty list
  if (inputJson == null) {
    return [firstItem];
  }

  final dynamic decoded =
      inputJson is String ? jsonDecode(inputJson) : inputJson;

  // If not a list, return as-is
  if (decoded is! List) {
    return decoded;
  }

  // Empty list
  if (decoded.isEmpty) {
    return [firstItem];
  }

  // Case 1: List<Map> (your actual data structure)
  // Example: [{content: "url1"}, {content: "url2"}]
  if (decoded.first is Map) {
    final List<dynamic> result = [firstItem];
    for (var item in decoded) {
      if (item is Map && item.containsKey('content')) {
        result.add(item['content']);
      }
    }
    return result;
  }

  // Case 2: List<List<Map>> (nested structure)
  // Example: [[{content: "url1"}, {content: "url2"}]]
  if (decoded.first is List) {
    final innerList = decoded.first as List;

    if (innerList.isNotEmpty && innerList.first is Map) {
      final List<dynamic> result = [firstItem];
      for (var item in innerList) {
        if (item is Map && item.containsKey('content')) {
          result.add(item['content']);
        }
      }
      return result;
    }

    // If it's List<List<String>>
    if (innerList.isNotEmpty && innerList.first is String) {
      final List<String> result = [firstItem];
      result.addAll(List<String>.from(innerList));
      return result;
    }
  }

  // Case 3: List<String> (already strings)
  if (decoded.first is String) {
    final List<String> list = List<String>.from(decoded);
    list.removeWhere((e) => e == firstItem);
    list.insert(0, firstItem);
    return list;
  }

  // Fallback: return original
  return decoded;
}

bool isJsonLengthGreaterThan8(dynamic inputJson) {
  final decoded = inputJson is String ? jsonDecode(inputJson) : inputJson;

  // Flat list: ["a","b","c"]
  if (decoded is List && decoded.isNotEmpty && decoded.first is String) {
    return decoded.length > 8;
  }

  // Nested list: [["a","b"],["c"]]
  if (decoded is List) {
    int total = 0;
    for (final inner in decoded) {
      if (inner is List) total += inner.length;
    }
    return total > 8;
  }

  return false;
}

DateTime parseDate(String dateStr) {
  try {
    // Try ISO format first (Supabase / API format)
    return DateTime.parse(dateStr);
  } catch (e) {
    // Fallback to formatted string like "Mon, Apr 15, 2026"
    final formatter = DateFormat('EEE, MMM dd, yyyy');
    return formatter.parse(dateStr);
  }
}

List<VenueContentRow>? addDemoATfirstIndex(
    List<VenueContentRow>? venueContentList) {
  final demoRow = VenueContentRow({
    'id': -1,
    'content': null,
    'venue_id': null,
    'venue_thumbnail': null,
    'created_at': DateTime.now().toIso8601String(),
  });

  final List<VenueContentRow> updatedList = [];

  // Always add demo row first
  updatedList.add(demoRow);

  // Add existing data if available
  if (venueContentList != null && venueContentList.isNotEmpty) {
    updatedList.addAll(venueContentList);
  }

  return updatedList;
}

List<MusicianContentRow>? addDemoATfirstIndexMusician(
    List<MusicianContentRow> musicianContentList) {
  final demoRow = MusicianContentRow({
    'id': -1,
    'content': null,
    'created_by': null,
    'video_thumbnail': null,
    'created_at': DateTime.now().toIso8601String(),
  });

  final List<MusicianContentRow> updatedList = [];

  // Always add demo row first
  updatedList.add(demoRow);

  // Add existing data if available
  if (musicianContentList != null && musicianContentList.isNotEmpty) {
    updatedList.addAll(musicianContentList);
  }

  return updatedList;
}

List<ContentListStruct>? addSampleFirstIndex(List<ContentListStruct>? list) {
  if (list == null) return null;

  // Convert dynamic to proper list
  List<ContentListStruct> updatedList = List<ContentListStruct>.from(list);

  // Create sample item
  final sampleItem = ContentListStruct(
    thumbnailImage: "Sample Image",
    content: "This is sample content",
  );

  // Insert at first index
  updatedList.insert(0, sampleItem);

  return updatedList;
}

List<String>? addImageAtFirstIndex(List<String>? list) {
  const String sampleImage =
      "https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/addImage.png";

  if (list == null) {
    return [sampleImage];
  }

  // Create a new list to avoid modifying original reference
  final updatedList = List<String>.from(list);

  // Insert at first index
  updatedList.insert(0, sampleImage);

  return updatedList;
}

DateTime? stringToDateTime(
  String date,
  String time,
) {
  final formats = [
    // 12-hour formats
    "EEE, MMM dd, yyyy h:mm a",
    "EEE, MMM d, yyyy h:mm a",
    "MMM dd, yyyy h:mm a",
    "MMM d, yyyy h:mm a",

    // 24-hour formats
    "EEE, MMM dd, yyyy HH:mm",
    "EEE, MMM d, yyyy HH:mm",
    "MMM dd, yyyy HH:mm",
    "MMM d, yyyy HH:mm",
  ];

  for (final pattern in formats) {
    try {
      final format = DateFormat(pattern, "en_US");
      return format.parse("$date $time");
    } catch (_) {
      // try next format
    }
  }

  print("❌ Failed to parse: $date $time");
  return null;
}

List<int>? stringToIntList(String string) {
  if (string.isEmpty) return [];

  final List<dynamic> parsed = jsonDecode(string);

  return parsed.map((e) => int.tryParse(e.toString()) ?? 0).toList();
}

dynamic removeFirstIndexJson(dynamic inputJson) {
  List<dynamic> data =
      inputJson is String ? jsonDecode(inputJson) : List.from(inputJson);

  if (data.isNotEmpty && data.first['id'] == 0) {
    data.removeAt(0);
  }

  return data;
}

dynamic convertToJson(List<ContentListStruct>? contentData) {
  if (contentData == null || contentData.isEmpty) {
    return [];
  }

  return contentData.map((item) => item.toMap()).toList();
}

String formatMessageTime(DateTime timestamp) {
  if (timestamp == null) return '';

  final messageTime = timestamp.toLocal();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final msgDate =
      DateTime(messageTime.year, messageTime.month, messageTime.day);
  final difference = today.difference(msgDate).inDays;

  String formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    if (hour == 0) hour = 12;
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$hour:$minuteStr $period';
  }

  String formatDate(DateTime date) {
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String year = date.year.toString().substring(2);
    return '$month/$day/$year';
  }

  List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  if (difference == 0) {
    return formatTime(messageTime);
  } else if (difference == 1) {
    return 'Yesterday';
  } else if (difference < 7) {
    return weekdays[messageTime.weekday - 1];
  } else {
    return formatDate(messageTime);
  }
}

DateTime? toUtcTimestamp(DateTime timestamp) {
  return timestamp.toUtc();
}
