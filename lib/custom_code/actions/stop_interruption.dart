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
import 'package:audio_session/audio_session.dart';

Future<void> stopInterruption() async {
  try {
    FFAppState().update(() {
      FFAppState().interruption = false;
    });

    FFAppState().update(() {
      FFAppState().log = 'interruption False';
    });
  } catch (e) {
    // Handle any errors
    FFAppState().update(() {
      FFAppState().log = 'Error deactivating audio session: $e';
    });
  }
}
