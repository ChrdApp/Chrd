import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_profile_posts_model.dart';
export 'musician_profile_posts_model.dart';

class MusicianProfilePostsWidget extends StatefulWidget {
  const MusicianProfilePostsWidget({super.key});

  static String routeName = 'musician_profile_posts';
  static String routePath = '/musicianProfilePosts';

  @override
  State<MusicianProfilePostsWidget> createState() =>
      _MusicianProfilePostsWidgetState();
}

class _MusicianProfilePostsWidgetState
    extends State<MusicianProfilePostsWidget> {
  late MusicianProfilePostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianProfilePostsModel());

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
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 100.0,
                      buttonSize: 42.0,
                      fillColor: Color(0x2BFFFFFF),
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'Posts (${(FFAppState().musicianAddImages.length - 1).toString()})',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final musicianPosts =
                        FFAppState().musicianAddImages.toList();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: musicianPosts.length,
                      itemBuilder: (context, musicianPostsIndex) {
                        final musicianPostsItem =
                            musicianPosts[musicianPostsIndex];
                        return Container(
                          width: 110.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '${musicianPostsItem}',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        );
                      },
                    );
                  },
                ),
              ]
                  .divide(SizedBox(height: 28.0))
                  .addToStart(SizedBox(height: 28.0))
                  .addToEnd(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
