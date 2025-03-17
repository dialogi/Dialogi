// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PaywallViewWidget extends StatefulWidget {
  const PaywallViewWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PaywallViewWidget> createState() => _PaywallViewWidgetState();
}

class _PaywallViewWidgetState extends State<PaywallViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PaywallView(
            onDismiss: () {
              Navigator.pop(context);

              // Dismiss the paywall, i.e. remove the view, navigate to another screen, etc.
              // Will be called when the close button is pressed (if enabled) or when a purchase succeeds.
            },
          ),
        ),
      ),
    );
  }
}
