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

import 'dart:async';
import 'dart:developer';

import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

Future<void> presentPaywall() async {
  final paywallResult =
      await RevenueCatUI.presentPaywall(displayCloseButton: false);

  // Convert the paywallResult to a string or extract specific fields if needed
  FFAppState().update(() {
    FFAppState().log =
        paywallResult.toString(); // Or extract specific details if needed
  });
  log('Paywall result: $paywallResult');
}
