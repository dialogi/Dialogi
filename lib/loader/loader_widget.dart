import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'loader_model.dart';
export 'loader_model.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  late LoaderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'loader'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADER_PAGE_loader_ON_INIT_STATE');
      logFirebaseEvent('loader_action_block');
      await action_blocks.setLang(context);
      safeSetState(() {});
      logFirebaseEvent('loader_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1500));
      if (loggedIn) {
        if (valueOrDefault<bool>(currentUserDocument?.onboarded, false)) {
          logFirebaseEvent('loader_navigate_to');

          context.pushNamed('homepage');
        } else {
          logFirebaseEvent('loader_navigate_to');

          context.pushNamed('start_onboarding');
        }
      } else {
        logFirebaseEvent('loader_navigate_to');

        context.pushNamed('login');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 233.0,
                      height: 230.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'vh2zj7nw' /* Dialogi */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 32.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.1,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
