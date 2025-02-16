import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/bubble_thinking_widget.dart';

// Focus widget keys for this walkthrough
final columnW1z0v1kz = GlobalKey();

/// StartLesson
///
/// start
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: columnW1z0v1kz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomLeft,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => BubbleThinkingWidget(
              title: 'התחלת שיעור',
              description:
                  'כדי להתחיל בשיעור, פשוט בחרו את המורה שתרצה לדבר איתו והתחילו בשיחה.',
              positionTriangle: 'topRight',
            ),
          ),
        ],
      ),
    ];
