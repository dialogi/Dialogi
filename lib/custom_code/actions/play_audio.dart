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

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

Future playAudio(String filePath) async {
  // Add your function code here!

  // Play the generated speech using audioplayers
  final player = AudioPlayer();

  // Await completion of the audio playback
  await player.play(DeviceFileSource(filePath));

  FFAppState().update(() {
    FFAppState().log = 'waiting3';
  });
  // Listen for playback completion before returning
  await player.onPlayerComplete.first;
}
