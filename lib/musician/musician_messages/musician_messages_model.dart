import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/musician_nav_bar_widget.dart';
import '/components/notification_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'musician_messages_widget.dart' show MusicianMessagesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianMessagesModel extends FlutterFlowModel<MusicianMessagesWidget> {
  ///  Local state fields for this page.

  dynamic gigList;

  ///  State fields for stateful widgets in this page.

  Stream<List<GigsRow>>? realtimeListViewSupabaseStream;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for musicianNavBar component.
  late MusicianNavBarModel musicianNavBarModel;

  @override
  void initState(BuildContext context) {
    musicianNavBarModel = createModel(context, () => MusicianNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    musicianNavBarModel.dispose();
  }
}
