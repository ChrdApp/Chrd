import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'musician_profile_venue_widget.dart' show MusicianProfileVenueWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianProfileVenueModel
    extends FlutterFlowModel<MusicianProfileVenueWidget> {
  ///  Local state fields for this page.

  bool isUploading = false;

  bool isTextExpanded = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel1;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel2;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel3;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDProfilePostModel1 = createModel(context, () => CHRDProfilePostModel());
    cHRDProfilePostModel2 = createModel(context, () => CHRDProfilePostModel());
    cHRDProfilePostModel3 = createModel(context, () => CHRDProfilePostModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDProfilePostModel1.dispose();
    cHRDProfilePostModel2.dispose();
    cHRDProfilePostModel3.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
