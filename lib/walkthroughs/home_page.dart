import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/bubble_thinking_widget.dart';

// Focus widget keys for this walkthrough
final textTryx6f7i = GlobalKey();
final columnE6dnldkt = GlobalKey();

/// HomePage
///
/// השיעורים האחרונים שביצעת
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// hello
      TargetFocus(
        keyTarget: textTryx6f7i,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => BubbleThinkingWidget(
              title: 'ברוכים הבאים!',
              description:
                  'ברוכים הבאים! סיימתם את תהליך האפיון בהצלחה! עכשיו, נתחיל ללמוד אנגלית בצורה שתמיד חלמתם עליה - פשוט וכיף! 😃',
              positionTriangle: 'topRight',
            ),
          ),
        ],
      ),

      /// lessons: אלו רשימת השיעורים האחרונים
      TargetFocus(
        keyTarget: columnE6dnldkt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => BubbleThinkingWidget(
              title: 'רשימת השיעורים',
              description:
                  'כאן יוצגו השיעורים הקודמים - לחצו על הקלף כדי לראות סיכום של שיעור קודם',
              positionTriangle: 'topLeft',
            ),
          ),
        ],
      ),
    ];
