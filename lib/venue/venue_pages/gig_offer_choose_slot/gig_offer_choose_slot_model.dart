import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_components/collapsable_slotlist/collapsable_slotlist_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'gig_offer_choose_slot_widget.dart' show GigOfferChooseSlotWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GigOfferChooseSlotModel
    extends FlutterFlowModel<GigOfferChooseSlotWidget> {
  ///  Local state fields for this page.

  bool expand = false;

  bool select = false;

  ///  State fields for stateful widgets in this page.

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Upsert gigs)] action in CHRD_Label_Btn widget.
  ApiCallResponse? upsertGigOfferOutput;
  // Stores action output result for [Backend Call - API (Send Notification)] action in CHRD_Label_Btn widget.
  ApiCallResponse? notificationOutput;

  @override
  void initState(BuildContext context) {
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelBtnModel.dispose();
  }
}
