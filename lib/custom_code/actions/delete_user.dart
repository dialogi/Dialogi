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

import '/auth/firebase_auth/auth_util.dart';

Future deleteUser(BuildContext context) async {
  // Log event before action for clarity
  logFirebaseEvent('SETTINGS_PAGE_Delete_User_ON_TAP');

  // Delete user account
  await authManager.deleteUser(context);

  // Sign out the user completely
  GoRouter.of(context).prepareAuthEvent();
  await authManager.signOut();
  GoRouter.of(context).clearRedirectLocation();

  // Navigate directly to login screen after deletion
  context.goNamedAuth('login', context.mounted);
}
