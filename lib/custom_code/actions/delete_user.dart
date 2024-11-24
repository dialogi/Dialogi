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

import 'package:dialogi_app/auth/firebase_auth/auth_util.dart';

Future deleteUser(BuildContext context) async {
  // Add your function code here!

  await authManager.deleteUser(context);

  context.goNamedAuth('homepage', context.mounted);
  logFirebaseEvent('SETTINGS_PAGE_Text_vt1rt3eu_ON_TAP');
  logFirebaseEvent('Text_auth');
  GoRouter.of(context).prepareAuthEvent();
  await authManager.signOut();
  GoRouter.of(context).clearRedirectLocation();

  context.goNamedAuth('login', context.mounted);
}
