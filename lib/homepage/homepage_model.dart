import '/components/popup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'homepage_widget.dart' show HomepageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homePageController;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    homePageController?.finish();
  }

  /// Action blocks.
  Future startPronouns(
    BuildContext context, {
    required String? subject,
  }) async {
    if (!FFAppState().userSub.hasPronunciation()) {
      logFirebaseEvent('startPronouns_action_block');
      await action_blocks.userSubscriptionLoad(context);
    }
    if ((FFAppState().userSub.pronunciation == true) &&
        FFAppState().lessonEnable) {
      logFirebaseEvent('startPronouns_navigate_to');

      context.goNamed(
        'start_dialog',
        queryParameters: {
          'subject': serializeParam(
            subject,
            ParamType.String,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 900),
          ),
        },
      );
    } else {
      if (FFAppState().userSub.pronunciation == true) {
        logFirebaseEvent('startPronouns_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: PopupWidget(
                  title: 'הישג מרשים!',
                  subTitle: 'כל הכבוד! סיימת את מכסת השיעורים שלך לשבוע זה! 🎉',
                  onClick: () async {},
                ),
              ),
            );
          },
        );
      } else {
        logFirebaseEvent('startPronouns_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: PopupWidget(
                  title: 'שדרגו את החבילה כדי לקבל גישה לתרגול הגייה',
                  subTitle:
                      'מעוניינים לתרגל הגייה? מצויין! שדרגו עכשיו את החבילה שלכם',
                  button: 'שדרוג החבילה כעת',
                  onClick: () async {
                    logFirebaseEvent('_action_block');
                    await action_blocks.paywallRevenueCat(context);
                  },
                ),
              ),
            );
          },
        );
      }
    }
  }
}
