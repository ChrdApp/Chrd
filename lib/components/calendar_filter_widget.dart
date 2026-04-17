import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_filter_model.dart';
export 'calendar_filter_model.dart';

class CalendarFilterWidget extends StatefulWidget {
  const CalendarFilterWidget({super.key});

  @override
  State<CalendarFilterWidget> createState() => _CalendarFilterWidgetState();
}

class _CalendarFilterWidgetState extends State<CalendarFilterWidget> {
  late CalendarFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarFilterModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.venueOutput = await VenuesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'created_by',
          FFAppState().userId,
        ),
      );
    });

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
        Expanded(
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFF030303),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.slidersH,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 22.0,
                          ),
                          Text(
                            'Filter',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_outlined,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  if (_model.venueOutput != null &&
                      (_model.venueOutput)!.isNotEmpty)
                    FutureBuilder<ApiCallResponse>(
                      future: VenueGroup.getUserVenuesCall.call(
                        userId: FFAppState().userId,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final multiSelectDropdownCopyGetUserVenuesResponse =
                            snapshot.data!;

                        return Container(
                          width: double.infinity,
                          height: 48.0,
                          child: custom_widgets.MultiSelectDropdownCopy(
                            width: double.infinity,
                            height: 48.0,
                            dropdownTitle: 'Venue',
                            dropdownText: 'Venue',
                            initialSelectedOptions:
                                FFAppState().FilteredVenueIds,
                            optionList: (getJsonField(
                              multiSelectDropdownCopyGetUserVenuesResponse
                                  .jsonBody,
                              r'''$..id''',
                              true,
                            ) as List?)!
                                .map<String>((e) => e.toString())
                                .toList()
                                .cast<String>(),
                            labelList: (getJsonField(
                              multiSelectDropdownCopyGetUserVenuesResponse
                                  .jsonBody,
                              r'''$..name''',
                              true,
                            ) as List?)!
                                .map<String>((e) => e.toString())
                                .toList()
                                .cast<String>(),
                            onSelectionChanged: (value) async {
                              FFAppState().FilteredVenueIds =
                                  value!.toList().cast<String>();
                              safeSetState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= FFAppState().filteredVenueStatus,
                    ),
                    options: ['Open', 'Booked'],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue = val);
                      FFAppState().filteredVenueStatus = _model.dropDownValue!;
                      safeSetState(() {});
                    },
                    width: double.infinity,
                    height: 48.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    hintText: 'Status',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ]
                    .divide(SizedBox(height: 32.0))
                    .addToStart(SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
