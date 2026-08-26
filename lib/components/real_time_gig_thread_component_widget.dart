import '/backend/supabase/supabase.dart';
import '/components/empty_list_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'real_time_gig_thread_component_model.dart';
export 'real_time_gig_thread_component_model.dart';

class RealTimeGigThreadComponentWidget extends StatefulWidget {
  const RealTimeGigThreadComponentWidget({
    super.key,
    required this.venueId,
  });

  /// Venue ID
  final int? venueId;

  @override
  State<RealTimeGigThreadComponentWidget> createState() =>
      _RealTimeGigThreadComponentWidgetState();
}

class _RealTimeGigThreadComponentWidgetState
    extends State<RealTimeGigThreadComponentWidget> {
  late RealTimeGigThreadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RealTimeGigThreadComponentModel());

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

    return StreamBuilder<List<GigsRow>>(
      stream: _model.realTimeListViewSupabaseStream ??= SupaFlow.client
          .from("gigs")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'venue_id',
            widget!.venueId,
          )
          .order('updated_at')
          .map((list) => list.map((item) => GigsRow(item)).toList()),
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
        List<GigsRow> realTimeListViewGigsRowList = snapshot.data!;

        if (realTimeListViewGigsRowList.isEmpty) {
          return EmptyListImageWidget(
            msg: 'Gig threads appear here once you reach out to a performer',
          );
        }

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            0,
            21.0,
            0,
            0,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: realTimeListViewGigsRowList.length,
          separatorBuilder: (_, __) => SizedBox(height: 40.0),
          itemBuilder: (context, realTimeListViewIndex) {
            final realTimeListViewGigsRow =
                realTimeListViewGigsRowList[realTimeListViewIndex];
            return FutureBuilder<List<UsersRow>>(
              future: UsersTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  realTimeListViewGigsRow.musicianId,
                ),
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
                List<UsersRow> containerUsersRowList = snapshot.data!;

                final containerUsersRow = containerUsersRowList.isNotEmpty
                    ? containerUsersRowList.first
                    : null;

                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      VenueGigThreadOverlayWidget.routeName,
                      queryParameters: {
                        'gigID': serializeParam(
                          realTimeListViewGigsRow.id,
                          ParamType.int,
                        ),
                        'venueName': serializeParam(
                          FFAppState().selectedVenueSwitch.venueName,
                          ParamType.String,
                        ),
                        'gigName': serializeParam(
                          containerUsersRow?.name,
                          ParamType.String,
                        ),
                        'isVenue': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                        'image': serializeParam(
                          containerUsersRow?.profilePhoto,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF01CDD0),
                                Color(0xFF04C8D0),
                                Color(0xFF0EBCD1),
                                Color(0xFF20A7D4),
                                Color(0xFF3A89D8),
                                Color(0xFF6951DC),
                                Color(0xFF8D28E3)
                              ],
                              stops: [0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 38.0,
                            height: 38.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              containerUsersRow!.profilePhoto!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerUsersRow?.name,
                                  'Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  realTimeListViewGigsRow.lastMessageContent,
                                  'Say Hi!',
                                ),
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
                            ].divide(SizedBox(height: 6.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              functions.formatTime(realTimeListViewGigsRow
                                  .updatedAt!
                                  .toString()),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryCyan,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            if (false)
                              Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryCyan,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                              ),
                          ].divide(SizedBox(height: 6.0)),
                        ),
                      ].divide(SizedBox(width: 13.0)),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
