import '/backend/supabase/supabase.dart';
import '/components/confirmation_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_h_r_d_video_player_component_model.dart';
export 'c_h_r_d_video_player_component_model.dart';

class CHRDVideoPlayerComponentWidget extends StatefulWidget {
  const CHRDVideoPlayerComponentWidget({
    super.key,
    this.videoUrl,
    this.videoThumbnail,
    this.contentId,
    bool? isHighlight,
    bool? isViewOnly,
    this.callBackAction,
  })  : this.isHighlight = isHighlight ?? false,
        this.isViewOnly = isViewOnly ?? false;

  final String? videoUrl;
  final String? videoThumbnail;
  final int? contentId;
  final bool isHighlight;
  final bool isViewOnly;
  final Future Function()? callBackAction;

  @override
  State<CHRDVideoPlayerComponentWidget> createState() =>
      _CHRDVideoPlayerComponentWidgetState();
}

class _CHRDVideoPlayerComponentWidgetState
    extends State<CHRDVideoPlayerComponentWidget> {
  late CHRDVideoPlayerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CHRDVideoPlayerComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              if ((widget!.contentId != null) && !widget!.isViewOnly)
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.delete_outline,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    showLoadingIndicator: true,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: ConfirmationDialogWidget(
                                acceptbtnText: 'Delete',
                                title: 'Are you sure you want to delete?',
                                acceptBtnAction: () async {
                                  await deleteSupabaseFileFromPublicUrl(
                                      widget!.videoUrl!);
                                  await deleteSupabaseFileFromPublicUrl(
                                      widget!.videoThumbnail!);
                                  if (widget!.isHighlight) {
                                    await HighlightsTable().delete(
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget!.contentId,
                                      ),
                                    );
                                  } else {
                                    await MusicianContentTable().delete(
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget!.contentId,
                                      ),
                                    );
                                  }

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  await widget.callBackAction?.call();
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: FlutterFlowVideoPlayer(
                path: widget!.videoUrl!,
                videoType: VideoType.network,
                width: MediaQuery.sizeOf(context).width * 1.0,
                autoPlay: true,
                looping: true,
                showControls: false,
                allowFullScreen: true,
                allowPlaybackSpeedMenu: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
