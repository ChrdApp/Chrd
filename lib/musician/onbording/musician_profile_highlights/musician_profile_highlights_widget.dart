import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'musician_profile_highlights_model.dart';
export 'musician_profile_highlights_model.dart';

class MusicianProfileHighlightsWidget extends StatefulWidget {
  const MusicianProfileHighlightsWidget({
    super.key,
    required this.id,
    bool? isVideo,
    required this.imageVideo,
  }) : this.isVideo = isVideo ?? false;

  final int? id;
  final bool isVideo;
  final String? imageVideo;

  static String routeName = 'musician_profile_highlights';
  static String routePath = '/musicianProfileHighlights';

  @override
  State<MusicianProfileHighlightsWidget> createState() =>
      _MusicianProfileHighlightsWidgetState();
}

class _MusicianProfileHighlightsWidgetState
    extends State<MusicianProfileHighlightsWidget> {
  late MusicianProfileHighlightsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicianProfileHighlightsModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.9, -0.9),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
              if (widget!.isVideo)
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowMediaDisplay(
                      path: '${widget!.imageVideo}',
                      imageBuilder: (path) => ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                        path: path,
                        width: double.infinity,
                        height: double.infinity,
                        autoPlay: true,
                        looping: false,
                        showControls: false,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  ),
                ),
              if (!widget!.isVideo)
                Expanded(
                  child: FlutterFlowMediaDisplay(
                    path: '${widget!.imageVideo}',
                    imageBuilder: (path) => ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        path,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                      path: path,
                      width: double.infinity,
                      height: double.infinity,
                      autoPlay: true,
                      looping: false,
                      showControls: false,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                ),
            ].addToStart(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
