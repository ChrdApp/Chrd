import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'venue_social_media6_widget.dart' show VenueSocialMedia6Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenueSocialMedia6Model extends FlutterFlowModel<VenueSocialMedia6Widget> {
  ///  Local state fields for this page.

  List<String> uploadData = [];
  void addToUploadData(String item) => uploadData.add(item);
  void removeFromUploadData(String item) => uploadData.remove(item);
  void removeAtIndexFromUploadData(int index) => uploadData.removeAt(index);
  void insertAtIndexInUploadData(int index, String item) =>
      uploadData.insert(index, item);
  void updateUploadDataAtIndex(int index, Function(String) updateFn) =>
      uploadData[index] = updateFn(uploadData[index]);

  List<String> isFill = [];
  void addToIsFill(String item) => isFill.add(item);
  void removeFromIsFill(String item) => isFill.remove(item);
  void removeAtIndexFromIsFill(int index) => isFill.removeAt(index);
  void insertAtIndexInIsFill(int index, String item) =>
      isFill.insert(index, item);
  void updateIsFillAtIndex(int index, Function(String) updateFn) =>
      isFill[index] = updateFn(isFill[index]);

  bool isInstagramError = false;

  bool isXError = false;

  bool isFbError = false;

  bool isYoutubeError = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in venue_social_media6 widget.
  List<VenuesRow>? venueResult;
  // Stores action output result for [Backend Call - Query Rows] action in venue_social_media6 widget.
  List<SocialMediaRow>? musicianResult;
  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // State field(s) for InstagramAccount widget.
  FocusNode? instagramAccountFocusNode;
  TextEditingController? instagramAccountTextController;
  String? Function(BuildContext, String?)?
      instagramAccountTextControllerValidator;
  // State field(s) for XAccount widget.
  FocusNode? xAccountFocusNode;
  TextEditingController? xAccountTextController;
  String? Function(BuildContext, String?)? xAccountTextControllerValidator;
  // State field(s) for FacebookAccount widget.
  FocusNode? facebookAccountFocusNode;
  TextEditingController? facebookAccountTextController;
  String? Function(BuildContext, String?)?
      facebookAccountTextControllerValidator;
  // State field(s) for YoutubeAccount widget.
  FocusNode? youtubeAccountFocusNode;
  TextEditingController? youtubeAccountTextController;
  String? Function(BuildContext, String?)?
      youtubeAccountTextControllerValidator;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Label_Btn widget.
  List<SocialMediaRow>? socialMediaOutput;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    instagramAccountFocusNode?.dispose();
    instagramAccountTextController?.dispose();

    xAccountFocusNode?.dispose();
    xAccountTextController?.dispose();

    facebookAccountFocusNode?.dispose();
    facebookAccountTextController?.dispose();

    youtubeAccountFocusNode?.dispose();
    youtubeAccountTextController?.dispose();

    cHRDLabelBtnModel.dispose();
  }
}
