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

import 'package:dialogi_app/auth/firebase_auth/auth_util.dart';
import 'package:dialogi_app/backend/push_notifications/push_notifications_util.dart';

Future onAppBackground() async {
// Add your function code here!
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
}

class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
// Do something when app is resumed
      print('App is in foreground');
    } else if (state == AppLifecycleState.paused && FFAppState().onLesson) {
      FFAppState().update(() {
        FFAppState().onLesson = false;
      });
      FFAppState().update(() {
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
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
