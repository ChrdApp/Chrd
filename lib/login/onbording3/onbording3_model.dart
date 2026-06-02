import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'onbording3_widget.dart' show Onbording3Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onbording3Model extends FlutterFlowModel<Onbording3Widget> {
  ///  Local state fields for this page.

  bool isSignup = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appleSignInAction] action in Container widget.
  String? appleSigninOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? appleuserOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  UsersRow? userOutputapple;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? googleuserOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  UsersRow? userOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
