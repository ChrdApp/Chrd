import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/musician/components/c_h_r_d_label_text_field_with_border/c_h_r_d_label_text_field_with_border_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'musician_account_info_widget.dart' show MusicianAccountInfoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianAccountInfoModel
    extends FlutterFlowModel<MusicianAccountInfoWidget> {
  ///  Local state fields for this page.

  bool hideMobileField = false;

  bool hideEmailField = false;

  String mobileNoValue = '';

  bool showMobileError = false;

  List<String> selectedEntertainment = [];
  void addToSelectedEntertainment(String item) =>
      selectedEntertainment.add(item);
  void removeFromSelectedEntertainment(String item) =>
      selectedEntertainment.remove(item);
  void removeAtIndexFromSelectedEntertainment(int index) =>
      selectedEntertainment.removeAt(index);
  void insertAtIndexInSelectedEntertainment(int index, String item) =>
      selectedEntertainment.insert(index, item);
  void updateSelectedEntertainmentAtIndex(
          int index, Function(String) updateFn) =>
      selectedEntertainment[index] = updateFn(selectedEntertainment[index]);

  List<String> selectedGenre = [];
  void addToSelectedGenre(String item) => selectedGenre.add(item);
  void removeFromSelectedGenre(String item) => selectedGenre.remove(item);
  void removeAtIndexFromSelectedGenre(int index) =>
      selectedGenre.removeAt(index);
  void insertAtIndexInSelectedGenre(int index, String item) =>
      selectedGenre.insert(index, item);
  void updateSelectedGenreAtIndex(int index, Function(String) updateFn) =>
      selectedGenre[index] = updateFn(selectedGenre[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CHRD_app_Bar2 component.
  late CHRDAppBar2Model cHRDAppBar2Model;
  // Model for CHRD_label_Column_Text component.
  late CHRDLabelColumnTextModel cHRDLabelColumnTextModel;
  // Model for First_Name.
  late CHRDLabelTextFieldWithBorderModel firstNameModel;
  // Model for Last_Name.
  late CHRDLabelTextFieldWithBorderModel lastNameModel;
  // Model for Email.
  late CHRDLabelTextFieldWithBorderModel emailModel;
  // State field(s) for Entertainment_DropDown widget.
  List<String>? entertainmentDropDownValue;
  FormFieldController<List<String>>? entertainmentDropDownValueController;
  // State field(s) for genre_DropDown widget.
  List<String>? genreDropDownValue;
  FormFieldController<List<String>>? genreDropDownValueController;
  // State field(s) for MusicianStatement widget.
  FocusNode? musicianStatementFocusNode;
  TextEditingController? musicianStatementTextController;
  String? Function(BuildContext, String?)?
      musicianStatementTextControllerValidator;
  String? _musicianStatementTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Musician Statement is required';
    }

    if (val.length > 250) {
      return 'Maximum 250 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Label_Btn widget.
  List<UsersRow>? authOutput;
  // Stores action output result for [Backend Call - Update Row(s)] action in CHRD_Label_Btn widget.
  List<UsersRow>? userOutput;

  @override
  void initState(BuildContext context) {
    cHRDAppBar2Model = createModel(context, () => CHRDAppBar2Model());
    cHRDLabelColumnTextModel =
        createModel(context, () => CHRDLabelColumnTextModel());
    firstNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    lastNameModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    emailModel =
        createModel(context, () => CHRDLabelTextFieldWithBorderModel());
    musicianStatementTextControllerValidator =
        _musicianStatementTextControllerValidator;
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
    firstNameModel.textControllerValidator = _formTextFieldValidator1;
    lastNameModel.textControllerValidator = _formTextFieldValidator2;
    emailModel.textControllerValidator = _formTextFieldValidator3;
  }

  @override
  void dispose() {
    cHRDAppBar2Model.dispose();
    cHRDLabelColumnTextModel.dispose();
    firstNameModel.dispose();
    lastNameModel.dispose();
    emailModel.dispose();
    musicianStatementFocusNode?.dispose();
    musicianStatementTextController?.dispose();

    cHRDLabelBtnModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter first name';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z]+([ \'-][A-Za-z]+)*\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter last name';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-z]+([ \'-][A-Za-z]+)*\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email';
    }
    return null;
  }
}
