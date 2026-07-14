import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_send_offer_pop_up/c_h_r_d_send_offer_pop_up_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'venue_musician_profile1_widget.dart' show VenueMusicianProfile1Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueMusicianProfile1Model
    extends FlutterFlowModel<VenueMusicianProfile1Widget> {
  ///  Local state fields for this page.

  bool isUploading = false;

  bool isTextExpanded = false;

  List<String> listItem = [];
  void addToListItem(String item) => listItem.add(item);
  void removeFromListItem(String item) => listItem.remove(item);
  void removeAtIndexFromListItem(int index) => listItem.removeAt(index);
  void insertAtIndexInListItem(int index, String item) =>
      listItem.insert(index, item);
  void updateListItemAtIndex(int index, Function(String) updateFn) =>
      listItem[index] = updateFn(listItem[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel1;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel2;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel3;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Stores action output result for [Backend Call - API (Send Notification)] action in CHRD_Label_Btn widget.
  ApiCallResponse? notificationoutput;
  // Stores action output result for [Backend Call - API (Upsert gigs)] action in CHRD_Label_Btn widget.
  ApiCallResponse? upsertOutput;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;
  // Stores action output result for [Backend Call - API (Upsert gigs)] action in CHRD_Label_Btn widget.
  ApiCallResponse? upsertOutputGenral;

  @override
  void initState(BuildContext context) {
    cHRDProfilePostModel1 = createModel(context, () => CHRDProfilePostModel());
    cHRDProfilePostModel2 = createModel(context, () => CHRDProfilePostModel());
    cHRDProfilePostModel3 = createModel(context, () => CHRDProfilePostModel());
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDProfilePostModel1.dispose();
    cHRDProfilePostModel2.dispose();
    cHRDProfilePostModel3.dispose();
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
