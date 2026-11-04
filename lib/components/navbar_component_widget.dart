import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_component_model.dart';
export 'navbar_component_model.dart';

class NavbarComponentWidget extends StatefulWidget {
  const NavbarComponentWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<NavbarComponentWidget> createState() => _NavbarComponentWidgetState();
}

class _NavbarComponentWidgetState extends State<NavbarComponentWidget> {
  late NavbarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (FFAppState().userType == Type.Venue)
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.VenueNavBar(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                currentIndex:
                    widget!.parameter1 != null ? widget!.parameter1! : 0,
              ),
            ),
          ),
        if (FFAppState().userType == Type.Musician)
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.MusicianNavBar(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                currentIndex:
                    widget!.parameter1 != null ? widget!.parameter1! : 0,
              ),
            ),
          ),
        if (FFAppState().userType == Type.Fan)
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.FanNavbar(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                currentIndex:
                    widget!.parameter1 != null ? widget!.parameter1! : 0,
              ),
            ),
          ),
      ],
    );
  }
}
