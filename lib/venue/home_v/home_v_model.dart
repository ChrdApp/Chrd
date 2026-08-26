import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/components/notification_icon_widget.dart';
import '/components/venue_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_venue_details/c_h_r_d_venue_details_widget.dart';
import '/venue/venue_pages/venue_components/no_venue_created_component/no_venue_created_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_v_widget.dart' show HomeVWidget;
import 'package:branchio_dynamic_linking_akp5u6/custom_code/actions/index.dart'
    as branchio_dynamic_linking_akp5u6_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeVModel extends FlutterFlowModel<HomeVWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in homeV widget.
  List<UsersRow>? userResponse;
  // Model for empty_list_image component.
  late EmptyListImageModel emptyListImageModel;
  // Model for venueNavBar component.
  late VenueNavBarModel venueNavBarModel;

  @override
  void initState(BuildContext context) {
    emptyListImageModel = createModel(context, () => EmptyListImageModel());
    venueNavBarModel = createModel(context, () => VenueNavBarModel());
  }

  @override
  void dispose() {
    emptyListImageModel.dispose();
    venueNavBarModel.dispose();
  }
}
