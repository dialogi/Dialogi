import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double? setFontSize(double fontSize) {
  try {
    double textScale =
        WidgetsBinding.instance.platformDispatcher.textScaleFactor;
    return fontSize / textScale;
  } catch (e) {
    return fontSize;
  }
}

dynamic formatMessages(List<MessageStruct> messages) {
  // Merging all messages into a single map with combined content
  Map<String, dynamic> result = {};

  for (var message in messages) {
    final map = message.toMap();
    map.remove('visible'); // Remove the "visible" key

    // You can concatenate contents here if necessary, assuming there's a single role
    if (!result.containsKey("role")) {
      result["role"] = map["role"]; // Keep the first role found
    }

    // Combine content as a single string
    result["content"] = (result["content"] ?? "") + map["content"] + " ";
  }

  // Trim the final content
  result["content"] = result["content"]?.trim();

  return result;
}

String? grabFirstName(String? displayName) {
  if (displayName == null || displayName.isEmpty) {
    return '';
  }
  final nameList = displayName.split(' ');
  if (nameList.isEmpty) {
    return '';
  }
  return nameList.first;
}

String getSummaries(List<LessonsRecord> lessons) {
  return lessons
      .map((doc) => doc.summary) // Extract summary field
      .where((summary) => summary != null) // Filter out null summaries
      .join(', '); // Join summaries with a comma
}

DateTime addDaysToInboundDate(
  DateTime inboundDate,
  int weeks,
) {
  return inboundDate.add(Duration(days: 7 * weeks));
}

DateTime parseIsoDate(String isoString) {
  return DateTime.parse(isoString);
}

int weeksToAddBeforeNow(DateTime start) {
  final now = DateTime.now();

  // Calculate the difference between now and the start date.
  final difference = now.difference(start);

  // If the start date is in the future, return 0.
  if (difference.isNegative) {
    return 0;
  }

  // Calculate the number of full weeks that fit in the difference.
  int weeks = difference.inDays ~/ 7;

  return weeks;
}
