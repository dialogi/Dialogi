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

import 'index.dart'; // Imports other custom actions
import '/auth/firebase_auth/auth_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Required for jsonEncode

import '/backend/push_notifications/push_notifications_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future onAppBackgroundOnboarding() async {
  FFAppState().update(() {
    FFAppState().log = 'ok';
  });
  const String functionUrl =
      'https://us-central1-dialogi-utan34.cloudfunctions.net/function-2';

  final response = await http.post(
    Uri.parse(functionUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'userId': currentUser!.uid}), // Changed to userId
  );

  if (response.statusCode == 200) {
    FFAppState().update(() {
      FFAppState().log = 'yayyyyy';
    });
  } else {
    FFAppState().update(() {
      FFAppState().log = ' ${response.body}';
    });
  }
}
