import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/upload_file_btn_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'add_venue_content5_widget.dart' show AddVenueContent5Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AddVenueContent5Model extends FlutterFlowModel<AddVenueContent5Widget> {
  ///  Local state fields for this page.

  bool hideSkipButton = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in add_venue_content5 widget.
  List<VenueContentRow>? venueImageOutput;
  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Stores action output result for [Custom Action - pickFileWithSizeLimit] action in Container widget.
  FFUploadedFile? imageVideoPath;
  bool isDataUploading_venueContentUrl = false;
  FFUploadedFile uploadedLocalFile_venueContentUrl =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_venueContentUrl = '';

  // Stores action output result for [Custom Action - uploadMediaToSupabase] action in uploadFileBtn widget.
  String? uploadMediaFIles;
  // Stores action output result for [Backend Call - Delete Row(s)] action in IconButton widget.
  List<MusicianContentRow>? deleteMusicianContent;
  // Stores action output result for [Backend Call - Delete Row(s)] action in IconButton widget.
  List<MusicianContentRow>? deleteImageContentMusician;
  // Stores action output result for [Custom Action - uploadMediaToSupabase] action in uploadFileBtn widget.
  String? uploadMediaMusicianFIles;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Delete Venue)] action in CHRD_Label_Btn widget.
  ApiCallResponse? apiResultev9;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    cHRDLabelColumnTextModel.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
