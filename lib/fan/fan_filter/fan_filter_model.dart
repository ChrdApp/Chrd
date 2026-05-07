import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import 'fan_filter_widget.dart' show FanFilterWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FanFilterModel extends FlutterFlowModel<FanFilterWidget> {
  ///  Local state fields for this component.

  String? selectedDate;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel1;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel2;

  @override
  void initState(BuildContext context) {
    cHRDLabelBtnModel1 = createModel(context, () => CHRDLabelBtnModel());
    cHRDLabelBtnModel2 = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDLabelBtnModel1.dispose();
    cHRDLabelBtnModel2.dispose();
  }
}
