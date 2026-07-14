import '/auth/base_auth_user_provider.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'splashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().userType == Type.Venue) {
        if (FFAppState().step == 0) {
          context.goNamed(SplashScreen1Widget.routeName);
        } else if (FFAppState().step == 1) {
          context.goNamed(AccountCreation6Widget.routeName);
        } else if (FFAppState().step == 2) {
          context.goNamed(AddVenues2Widget.routeName);
        } else if (FFAppState().step == 3) {
          context.goNamed(AddPerformanceStages9Widget.routeName);
        } else if (FFAppState().step == 4) {
          context.goNamed(AddVenueOpenSlots10Widget.routeName);
        } else if (FFAppState().step == 5) {
          context.goNamed(HomeVWidget.routeName);
        } else if (FFAppState().step == 6) {
          context.goNamed(HomeVWidget.routeName);
        } else {
          if (FFAppState().step > 6) {
            context.goNamed(SplashScreen1Widget.routeName);
          } else {
            context.goNamed(SplashScreen1Widget.routeName);
          }
        }
      } else if (FFAppState().userType == Type.Musician) {
        if (FFAppState().step == 0) {
          context.goNamed(SplashScreen1Widget.routeName);
        } else if (FFAppState().step == 1) {
          context.goNamed(AccountCreation6Widget.routeName);
        } else {
          context.goNamed(HomeMWidget.routeName);
        }
      } else {
        await Future.delayed(
          Duration(
            milliseconds: 2000,
          ),
        );
        if (loggedIn) {
          context.goNamed(AccountCreation6Widget.routeName);
        } else {
          context.goNamed(SplashScreen1Widget.routeName);
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/000_Intro.png',
              ).image,
            ),
          ),
        ),
      ),
    );
  }
}
