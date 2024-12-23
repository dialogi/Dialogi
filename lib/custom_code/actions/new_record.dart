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

import 'index.dart'; // Imports other custom actions

import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async'; // Import for Completer

import '/custom_code/actions/index.dart' as actions;

Future<String> newRecord() async {
  double voiceDecibel = 0.0; // Voice decibel level
  int silenceDuration = 0; // Silence duration in seconds
  int maxDuration = 25; // Max recording duration in seconds
  DateTime? startTime; // Start time of recording
  stt.SpeechToText speech = stt.SpeechToText();
  Completer<String> completer = Completer(); // Create a Completer
  String recognizedText = '';

  bool isAvailable = await speech.initialize(debugLogging: true);

  void soundLevelListener(double level) {
    FFAppState().update(() {
      FFAppState().interruption = true;
    });
    voiceDecibel = level;

    FFAppState().update(() {
      FFAppState().log =
          '${voiceDecibel} ${silenceDuration} ${isAvailable} ${recognizedText}';
    });
    if (voiceDecibel < -20) {
      silenceDuration++;
    } else {
      silenceDuration = 0; // Reset silence duration if sound is detected
    }

    if (startTime != null) {
      DateTime now = DateTime.now();
      int elapsedSeconds = now.difference(startTime!).inSeconds;

      if (elapsedSeconds >= 10 ||
          silenceDuration >= 30 ||
          (FFAppState().userInput != null &&
              FFAppState().userInput.isNotEmpty)) {
        speech.stop();

        if (!completer.isCompleted) {
          completer.complete(
              recognizedText); // Complete the Completer with the recognized text

          if (recognizedText == '' &&
              (FFAppState().userInput == null ||
                  !FFAppState().userInput.isNotEmpty)) {
            FFAppState().update(() {
              FFAppState().userInput = 'silent';
            });
          }
        }
      }
    }
  }

  if (isAvailable) {
    startTime = DateTime.now();

    speech.listen(
      onResult: (result) {
        recognizedText = result.recognizedWords;
      },
      onSoundLevelChange: soundLevelListener,
      listenFor: Duration(seconds: 30), // Max 30 seconds
    );
  } else {
    FFAppState().update(() {
      FFAppState().log = 'woww';
    });

    return completer
        .future; // Return the future that will complete when the recording finishes
  }

  return completer
      .future; // Return the future that will complete when the recording finishes
}
