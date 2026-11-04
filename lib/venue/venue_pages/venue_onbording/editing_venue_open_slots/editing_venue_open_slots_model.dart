import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_date_time_select/c_h_r_d_date_time_select_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_performance_stages/c_h_r_d_performance_stages_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_row_with_icon/c_h_r_d_row_with_icon_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'editing_venue_open_slots_widget.dart' show EditingVenueOpenSlotsWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditingVenueOpenSlotsModel
    extends FlutterFlowModel<EditingVenueOpenSlotsWidget> {
  ///  Local state fields for this page.

  String? repeatTime;

  int? selectedStageId;

  String? days = 'Select';

  String? time = 'select';

  String? loadDurationTime = '-';

  DateTime? loadTime;

  DateTime? pickedDate;

  bool isLoader = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Slot Details)] action in editing_venue_open_slots widget.
  ApiCallResponse? slotDetailsOutput;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel1;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel2;
  // Stores action output result for [Custom Action - showConstrainedTimePicker] action in CHRD_row_with_icon widget.
  DateTime? selectedTime;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel3;
  // Model for CHRD_row_with_icon component.
  late CHRDRowWithIconModel cHRDRowWithIconModel4;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in CHRD_row_with_icon widget.
  dynamic? performanceStage;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - API (Update Venue Slots Unified)] action in CHRD_Label_Btn widget.
  ApiCallResponse? updateSlots;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    cHRDRowWithIconModel1 = createModel(context, () => CHRDRowWithIconModel());
    cHRDRowWithIconModel2 = createModel(context, () => CHRDRowWithIconModel());
    cHRDRowWithIconModel3 = createModel(context, () => CHRDRowWithIconModel());
    cHRDRowWithIconModel4 = createModel(context, () => CHRDRowWithIconModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDLabelColumnTextModel.dispose();
    cHRDRowWithIconModel1.dispose();
    cHRDRowWithIconModel2.dispose();
    cHRDRowWithIconModel3.dispose();
    cHRDRowWithIconModel4.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cHRDLabelBtnModel.dispose();
  }
}
