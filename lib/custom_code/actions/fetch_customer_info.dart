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

import 'package:purchases_flutter/purchases_flutter.dart';

Future fetchCustomerInfo() async {
  try {
    // Attempt to retrieve the latest CustomerInfo
    CustomerInfo? customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo != null) {
      // Extract relevant information and update FFAppState
      String activeEntitlements =
          customerInfo.entitlements.active.keys.join(', ');
      FFAppState().update(() {
        FFAppState().log = 'Active entitlements: $activeEntitlements';
      });
    } else {
      // Handle the case where customerInfo is null
      FFAppState().update(() {
        FFAppState().log = 'Failed to retrieve customer information.';
      });
    }
  } catch (e) {}
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
