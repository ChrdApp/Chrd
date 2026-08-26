import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chrd_social_media_model.dart';
export 'chrd_social_media_model.dart';

class ChrdSocialMediaWidget extends StatefulWidget {
  const ChrdSocialMediaWidget({
    super.key,
    this.parameter1,
  });

  final dynamic parameter1;

  @override
  State<ChrdSocialMediaWidget> createState() => _ChrdSocialMediaWidgetState();
}

class _ChrdSocialMediaWidgetState extends State<ChrdSocialMediaWidget> {
  late ChrdSocialMediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChrdSocialMediaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await launchURL(widget!.parameter1!.toString());
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/tiktok.png',
            width: 14.0,
            height: 14.0,
            fit: BoxFit.cover,
          ),
          Text(
            'TikTok',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ].divide(SizedBox(width: 4.0)),
      ),
    );
  }
}
