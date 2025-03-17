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

import 'index.dart'; // Imports other custom actions

import '/auth/firebase_auth/auth_util.dart';
import 'package:http/http.dart' as http;

import '/backend/push_notifications/push_notifications_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future onAppBackground() async {
// Add your function code here!
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
}

class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    FFAppState().update(() {
      FFAppState().log = state.toString();
    });

    if (state == AppLifecycleState.resumed) {
      print('App is in foreground');
    } else if (state == AppLifecycleState.paused &&
        FFAppState().log == 'oboarding') {
      _handlePausedState();
    } else if (state == AppLifecycleState.paused && FFAppState().onLesson) {
      _handleLessonPaused();
    }
  }

  // Asynchronous handling for the paused state
  Future<void> _handlePausedState() async {
    const String functionUrl =
        'https://us-central1-dialogi-utan34.cloudfunctions.net/function-2';

    final response = await http.post(
      Uri.parse(functionUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': currentUser!.uid}),
    );

    if (response.statusCode == 200) {
      print('FCM Token sent successfully');
    } else {
      print('Failed to send FCM Token: ${response.statusCode}');
    }
  }

  // Handling lesson pause notification
  void _handleLessonPaused() {
    FFAppState().update(() {
      FFAppState().onLesson = false;
      FFAppState().startPopup = true;
    });

    triggerPushNotification(
      notificationTitle: 'השיעור שלך ממשיך להתקדם!',
      notificationText:
          'חזור בהקדם כדי לא לפספס את ההזדמנות לשפר את האנגלית שלך! ',
      notificationSound: 'default',
      userRefs: [currentUserReference!],
      initialPageName: 'on_dialog_chat',
      parameterData: {
        'lessonId': '',
        'assistantId': '',
      },
    );

    print('App is in background');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
