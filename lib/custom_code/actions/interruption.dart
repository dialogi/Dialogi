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

import 'package:audio_session/audio_session.dart';

int _interruptionCallCount = 0; // External counter

Future<void> interruption() async {
  // Increment the call count
  _interruptionCallCount++;

  // Obtain the audio session instance
  final session = await AudioSession.instance;

  // Configure the audio session for speech
  await session.configure(AudioSessionConfiguration.speech());

  // Activate the audio session before playing audio.
  if (await session.setActive(true)) {
    FFAppState().update(() {
      FFAppState().log = 'Call #$_interruptionCallCount: Session activated';
    });
  } else {
    // Log if the session activation was denied
    FFAppState().update(() {
      FFAppState().log =
          'Call #$_interruptionCallCount: Audio session activation denied';
    });
  }

  // Listen for interruptions in the audio session
  session.interruptionEventStream.listen((event) {
    if (event.begin) {
      FFAppState().update(() {
        FFAppState().onLesson = false;
      });
      FFAppState().update(() {
        FFAppState().startPopup = true;
      });
      // Log interruption type when it begins
      FFAppState().update(() {
        FFAppState().log =
            'Call #$_interruptionCallCount: Interruption started - ${event.type}';
      });
    }
    switch (event.type) {
      case AudioInterruptionType.duck:
        // Handle 'duck' type interruption (lower audio volume)
        break;
      case AudioInterruptionType.pause:
      case AudioInterruptionType.unknown:
        // Handle 'pause' and 'unknown' types (pause audio playback)
        break;
    }

    if (!event.begin) {
      // Handle end of interruption
      switch (event.type) {
        case AudioInterruptionType.duck:
          // Handle unducking (restore audio volume)
          break;
        case AudioInterruptionType.pause:
          // Log when resuming from a pause interruption
          FFAppState().update(() {
            FFAppState().log =
                'Call #$_interruptionCallCount: Resuming from pause';
          });
          break;
        case AudioInterruptionType.unknown:
          // Do not resume if interruption type is unknown
          break;
      }
    }
  });
}
