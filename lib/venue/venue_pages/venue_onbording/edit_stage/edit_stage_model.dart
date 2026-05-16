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
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_stage_widget.dart' show EditStageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditStageModel extends FlutterFlowModel<EditStageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Stage Detail)] action in editStage widget.
  ApiCallResponse? stageDetailOutput;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for CHRD_Label_TextField_With_border component.
  late CHRDLabelTextFieldWithBorderModel cHRDLabelTextFieldWithBorderModel;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - uploadMediaToSupabase] action in uploadFileBtn widget.
  String? editUploadMediaFIles;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    cHRDLabelTextFieldWithBorderModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelTextFieldWithBorderModel.textControllerValidator =
        _formTextFieldValidator;
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    cHRDLabelTextFieldWithBorderModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title is required';
    }

    return null;
  }
}
