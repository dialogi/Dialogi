import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/bubble_thinking_widget.dart';

// Focus widget keys for this walkthrough
final rowDosgrcgx = GlobalKey();
final textYlu0c17m = GlobalKey();
final imageRlqdscy0 = GlobalKey();
final rowJnt8g7ix = GlobalKey();
final containerF8u3q301 = GlobalKey();
final buttonEcf5egto = GlobalKey();
final buttonUipf3jkg = GlobalKey();
final progressBarYujb1y9j = GlobalKey();

/// dialog
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Timer
      TargetFocus(
        keyTarget: rowDosgrcgx,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'טיימר',
              description:
                  'הטיימר עוזר לכם לעקוב אחרי הזמן בשיעור - מוכנים להתחיל?',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textYlu0c17m,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'אינדיקציה',
              description:
                  'סטטוס השיחה מראה לכם מתי תורך לדבר או להאזין למורה.',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// אד
      TargetFocus(
        keyTarget: imageRlqdscy0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'תמלול',
              description:
                  'כאן תראו את תמלול השיחה, כדי שיהיה קל לעקוב אחרי מה שנאמר.',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: rowJnt8g7ix,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'פירוט השיחה',
              description: 'כאן תוכלו לראות את שם המורה ואת מס השיעור',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// jjebh
      TargetFocus(
        keyTarget: containerF8u3q301,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'ניהול שיחה',
              description:
                  'הנה איך זה עובד: תוכלו לעצור, להחזיר אחורה, או לסיים מתי שתרצו. המורה שלנו פה כדי להקשיב ולעזור לכם לשפר את האנגלית שלך.',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: buttonEcf5egto,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'סיום שיחה',
              description:
                  'סיימתם את השיחה? לחצו על הכפתור כדי לסיים ולהתקדם לשלב הבא!* לא ניתן לחזור לשיחה לאחר הסיום ',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: buttonUipf3jkg,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'חזור שנית',
              description:
                  'לחצו על \'חזור שנית\' כדי לשמוע שוב את המשפט האחרון של המורה.',
              positionTriangle: '',
            ),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: progressBarYujb1y9j,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const BubbleThinkingWidget(
              title: 'שליטה בשיעור',
              description:
                  'האינדיקטורים ישתנו בהתאם לאפשרויות - יהיה אפשרות לעצור או להמשיך את השיעור בלחיצה על הכפתור',
              positionTriangle: '',
            ),
          ),
        ],
      ),
    ];
