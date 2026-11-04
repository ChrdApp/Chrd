import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'real_time_gig_thread_component_widget.dart'
    show RealTimeGigThreadComponentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RealTimeGigThreadComponentModel
    extends FlutterFlowModel<RealTimeGigThreadComponentWidget> {
  ///  State fields for stateful widgets in this component.

  Stream<List<GigsRow>>? realTimeListViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
