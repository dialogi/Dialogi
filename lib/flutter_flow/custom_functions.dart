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

DateTime? newCustomFunction() {
  return DateTime.now().subtract(Duration(days: 7));
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
