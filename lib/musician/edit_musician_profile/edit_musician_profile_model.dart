import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_container/c_h_r_d_container_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_musician_profile_widget.dart' show EditMusicianProfileWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMusicianProfileModel
    extends FlutterFlowModel<EditMusicianProfileWidget> {
  ///  Local state fields for this page.

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
  // Stores action output result for [Backend Call - Query Rows] action in edit_musician_profile widget.
  List<UsersRow>? userOutput;
  // Stores action output result for [Backend Call - API (Get Genre Entertainment type)] action in edit_musician_profile widget.
  ApiCallResponse? genreEntertainmentOutput;
  // Model for CHRD_Back_Btn component.
  late CHRDBackBtnModel cHRDBackBtnModel;
  // Model for CHRD_Container component.
  late CHRDContainerModel cHRDContainerModel1;
  // Stores action output result for [Backend Call - Query Rows] action in CHRD_Container widget.
  List<UsersRow>? updatedOutput;
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

  // Model for CHRD_Container component.
  late CHRDContainerModel cHRDContainerModel2;
  // Model for CHRD_Container component.
  late CHRDContainerModel cHRDContainerModel3;
  // Stores action output result for [Backend Call - API (Deactivate user)] action in Container widget.
  ApiCallResponse? deactivatedUserOutput;
  // Model for CHRD_Label_Btn component.
  late CHRDLabelBtnModel cHRDLabelBtnModel;

  @override
  void initState(BuildContext context) {
    cHRDBackBtnModel = createModel(context, () => CHRDBackBtnModel());
    cHRDContainerModel1 = createModel(context, () => CHRDContainerModel());
    musicianStatementTextControllerValidator =
        _musicianStatementTextControllerValidator;
    cHRDContainerModel2 = createModel(context, () => CHRDContainerModel());
    cHRDContainerModel3 = createModel(context, () => CHRDContainerModel());
    cHRDLabelBtnModel = createModel(context, () => CHRDLabelBtnModel());
  }

  @override
  void dispose() {
    cHRDBackBtnModel.dispose();
    cHRDContainerModel1.dispose();
    musicianStatementFocusNode?.dispose();
    musicianStatementTextController?.dispose();

    cHRDContainerModel2.dispose();
    cHRDContainerModel3.dispose();
    cHRDLabelBtnModel.dispose();
  }
}
