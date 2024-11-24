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

import 'package:dialogi_app/on_dialog_chat/on_dialog_chat_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

Future<void> fetchAndPlaySpeech(
    String promptText, String apiKey, String voice, bool hd) async {
  // Trim the input to remove any leading or trailing whitespace
  String trimmedPrompt = promptText.trim();

  // If the input is empty or just whitespace, return early or throw an error
  if (trimmedPrompt.isEmpty) {
    throw Exception('Input text cannot be empty or whitespace.');
  }

  // Set up the request headers and body
  Map<String, String> headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  String model =
      hd ? 'tts-1-hd' : 'tts-1'; // Choose model based on hd parameter

  String body = json.encode({
    'model': model,
    'voice': voice,
    'input': trimmedPrompt,
  });

  // Make the POST request to generate speech
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/audio/speech'),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    // Wait until FFAppState().onHold is false before proceeding
    while (FFAppState().dialogState == DialogState.AI_talking) {
      FFAppState().update(() {
        FFAppState().log = 'waiting';
      });
      await Future.delayed(Duration(milliseconds: 500));
    }

    FFAppState().update(() {
      FFAppState().log = 'yes';
    });
    FFAppState().update(() {
      FFAppState().dialogState = DialogState.AI_talking;
    });
    // Save the MP3 file locally
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/speech.mp3';
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    FFAppState().update(() {
      FFAppState().log = 'play';
    });
    // Play the generated speech using audioplayers
    final player = AudioPlayer();

    FFAppState().update(() {
      FFAppState().log = 'waiting2';
    });
    // Await completion of the audio playback
    await player.play(DeviceFileSource(filePath));

    while (FFAppState().onHold == true) {
      FFAppState().update(() {
        FFAppState().log = 'onHold';
      });
      await Future.delayed(Duration(milliseconds: 500));
    }
    FFAppState().update(() {
      FFAppState().log = 'waiting3';
    });
    // Listen for playback completion before returning
    await player.onPlayerComplete.first;

    FFAppState().update(() {
      FFAppState().log = 'waiting4';
    });
  } else {
    throw Exception(
        'Failed to generate speech. Status: ${response.statusCode}');
  }
}
