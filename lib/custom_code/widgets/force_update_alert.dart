// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:upgrader/upgrader.dart';

class ForceUpdateAlert extends StatefulWidget {
  const ForceUpdateAlert({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  final double? width;
  final double? height;
  final Widget Function()? child;

  @override
  State<ForceUpdateAlert> createState() => _ForceUpdateAlertState();
}

class _ForceUpdateAlertState extends State<ForceUpdateAlert> {
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: Duration.zero,
        debugDisplayAlways:
            true, // <-- UNCOMMENT to test before publishing a higher store version. REMOVE before release.
        minAppVersion: '1.0.3', // real force-update logic runs now
      ),
      showIgnore: false,
      showLater: false,
      barrierDismissible: false,
      showReleaseNotes: false,
      child: widget.child != null ? widget.child!() : const SizedBox.shrink(),
    );
  }
}
