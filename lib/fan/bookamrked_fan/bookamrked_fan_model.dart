import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/custobar_widget.dart';
import '/components/notification_icon_widget.dart';
import '/fan/fan_gigs/fan_gigs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'bookamrked_fan_widget.dart' show BookamrkedFanWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookamrkedFanModel extends FlutterFlowModel<BookamrkedFanWidget> {
  ///  Local state fields for this page.

  bool cf = false;

  ///  State fields for stateful widgets in this page.

  // Model for fan_gigs component.
  late FanGigsModel fanGigsModel;
  // Model for custobar component.
  late CustobarModel custobarModel;

  @override
  void initState(BuildContext context) {
    fanGigsModel = createModel(context, () => FanGigsModel());
    custobarModel = createModel(context, () => CustobarModel());
  }

  @override
  void dispose() {
    fanGigsModel.dispose();
    custobarModel.dispose();
  }
}
