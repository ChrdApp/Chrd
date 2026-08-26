import '/components/navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_page_model.dart';
export 'nav_page_model.dart';

class NavPageWidget extends StatefulWidget {
  const NavPageWidget({
    super.key,
    this.index,
  });

  final int? index;

  static String routeName = 'NavPage';
  static String routePath = '/navPage';

  @override
  State<NavPageWidget> createState() => _NavPageWidgetState();
}

class _NavPageWidgetState extends State<NavPageWidget> {
  late NavPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.ForceUpdateAlert(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: () => NavbarComponentWidget(
                parameter1: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
