import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_component/walkthrough_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final listViewIum3ofvq = GlobalKey();

/// WalkthorughPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: listViewIum3ofvq,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughComponentWidget(
              title: 'Check latest issues by Month',
            ),
          ),
        ],
      ),
    ];
