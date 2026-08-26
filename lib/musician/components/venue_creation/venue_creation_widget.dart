import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_creation_model.dart';
export 'venue_creation_model.dart';

class VenueCreationWidget extends StatefulWidget {
  const VenueCreationWidget({
    super.key,
    bool? isSelected,
  }) : this.isSelected = isSelected ?? false;

  final bool isSelected;

  @override
  State<VenueCreationWidget> createState() => _VenueCreationWidgetState();
}

class _VenueCreationWidgetState extends State<VenueCreationWidget> {
  late VenueCreationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueCreationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF153950), Color(0x39153950)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: widget!.isSelected ? Color(0xFF3A89D8) : Color(0x00000000),
          width: widget!.isSelected ? 3.0 : 0.0,
        ),
      ),
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                'assets/images/venue.png',
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: 138.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: 138.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x00153950),
                      Color(0x3A153950),
                      Color(0xFF153950)
                    ],
                    stops: [0.0, 0.002, 0.4],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14.0),
                    bottomRight: Radius.circular(14.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 14.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Venue',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        'Post events, book musicians, and attract audiences to your venue.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ),
            if (widget!.isSelected)
              Align(
                alignment: AlignmentDirectional(0.95, -0.85),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    FFIcons.kvector3,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
