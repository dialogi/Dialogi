// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Assuming SummaryObjStruct has these fields defined (replace with your actual structure)
Future<SummaryObjStruct> buildSummary(String summaryJson) async {
  // Check if summaryJson is not null
  if (summaryJson == null || summaryJson.isEmpty) {
    throw Exception("Invalid or empty JSON string");
  }

  // Parse the JSON string
  var parsedMessage = jsonDecode(summaryJson);

  // Extract the fields "summary" and "steps" from the parsed JSON
  String summary = parsedMessage['summary'];
  int steps = parsedMessage['steps'];

  // Return the result mapped to a SummaryObjStruct (adjust according to your struct)
  return SummaryObjStruct(
    summary: summary,
    steps: steps,
  );
}
