import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loader_popup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future userSubscriptionLoad(BuildContext context) async {
  ApiCallResponse? apiResultUser;
  SubscriptionsRecord? userSub;
  ApiCallResponse? detailed;
  int? lastestLessons;

  logFirebaseEvent('userSubscriptionLoad_backend_call');
  apiResultUser = await RevenueCatGroup.getCostumerCall.call(
    customerId: currentUserUid,
  );

  if ((apiResultUser.succeeded ?? true)) {
    if (!(RevenueCatGroup.getCostumerCall
                .currSubID(
                  (apiResultUser.jsonBody ?? ''),
                )
                ?.firstOrNull ==
            null ||
        RevenueCatGroup.getCostumerCall
                .currSubID(
                  (apiResultUser.jsonBody ?? ''),
                )
                ?.firstOrNull ==
            '')) {
      logFirebaseEvent('userSubscriptionLoad_firestore_query');
      userSub = await querySubscriptionsRecordOnce(
        queryBuilder: (subscriptionsRecord) => subscriptionsRecord.where(
          'subId',
          isEqualTo: RevenueCatGroup.getCostumerCall
              .currSubID(
                (apiResultUser?.jsonBody ?? ''),
              )
              ?.lastOrNull,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('userSubscriptionLoad_backend_call');
      detailed = await NewSubDetailsCall.call(
        customerId: currentUserUid,
      );

      logFirebaseEvent('userSubscriptionLoad_update_app_state');
      FFAppState().LastWeekSub = () {
        if (RevenueCatGroup.getCostumerCall
                .currSubID(
                  (apiResultUser?.jsonBody ?? ''),
                )
                ?.lastOrNull ==
            'entl75e9162b69') {
          return functions.addDaysToInboundDate(
              functions.parseIsoDate(NewSubDetailsCall.entl75e9162b69(
                (detailed?.jsonBody ?? ''),
              )!),
              functions.weeksToAddBeforeNow(
                  functions.parseIsoDate(NewSubDetailsCall.entl75e9162b69(
                (detailed?.jsonBody ?? ''),
              )!)));
        } else if (RevenueCatGroup.getCostumerCall
                .currSubID(
                  (apiResultUser?.jsonBody ?? ''),
                )
                ?.lastOrNull ==
            'entl054b154c1b') {
          return functions.addDaysToInboundDate(
              functions.parseIsoDate(NewSubDetailsCall.entl054b154c1b(
                (detailed?.jsonBody ?? ''),
              )!),
              functions.weeksToAddBeforeNow(
                  functions.parseIsoDate(NewSubDetailsCall.entl054b154c1b(
                (detailed?.jsonBody ?? ''),
              )!)));
        } else {
          return functions.addDaysToInboundDate(
              functions.parseIsoDate(NewSubDetailsCall.entl8b6abab155(
                (detailed?.jsonBody ?? ''),
              )!),
              functions.weeksToAddBeforeNow(
                  functions.parseIsoDate(NewSubDetailsCall.entl8b6abab155(
                (detailed?.jsonBody ?? ''),
              )!)));
        }
      }();
      FFAppState().update(() {});
      logFirebaseEvent('userSubscriptionLoad_update_app_state');
      FFAppState().userSub = SubscriptionDetailsStruct(
        subId: userSub?.subId,
        ttsHD: userSub?.ttsHD,
        name: userSub?.name,
        pronunciation: userSub?.pronunciation,
        frequencyPerWeek: userSub?.frequencyPerWeek,
        lessonLimit: userSub?.lessonLimit,
      );
      FFAppState().update(() {});
      logFirebaseEvent('userSubscriptionLoad_firestore_query');
      lastestLessons = await queryLessonsRecordCount(
        queryBuilder: (lessonsRecord) => lessonsRecord
            .where(
              'user',
              isEqualTo: currentUserUid,
            )
            .where(
              'start_at',
              isGreaterThanOrEqualTo: FFAppState().LastWeekSub,
            )
            .where(
              'first',
              isEqualTo: false,
            )
            .orderBy('start_at', descending: true),
      );
      logFirebaseEvent('userSubscriptionLoad_update_app_state');
      FFAppState().lessonEnable =
          lastestLessons < FFAppState().userSub.frequencyPerWeek;
      FFAppState().update(() {});
    }
  }
}

Future setLang(BuildContext context) async {
  logFirebaseEvent('setLang_set_app_language');
  setAppLanguage(context, 'he');
}

Future paywallRevenueCat(BuildContext context) async {
  logFirebaseEvent('paywallRevenueCat_custom_action');
  await actions.presentPaywall();
  logFirebaseEvent('paywallRevenueCat_alert_dialog');
  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 1.0,
          width: MediaQuery.sizeOf(context).width * 1.0,
          child: LoaderPopupWidget(
            title: 'כבר חוזרים...',
            loader: true,
          ),
        ),
      );
    },
  );

  logFirebaseEvent('paywallRevenueCat_wait__delay');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('paywallRevenueCat_action_block');
  await action_blocks.userSubscriptionLoad(context);
  logFirebaseEvent('paywallRevenueCat_close_dialog_drawer_et');
  Navigator.pop(context);
}
