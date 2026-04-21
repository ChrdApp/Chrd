import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custobar_model.dart';
export 'custobar_model.dart';

class CustobarWidget extends StatefulWidget {
  const CustobarWidget({
    super.key,
    this.index,
  });

  final int? index;

  @override
  State<CustobarWidget> createState() => _CustobarWidgetState();
}

class _CustobarWidgetState extends State<CustobarWidget> {
  late CustobarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustobarModel());

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
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget!.index != 0)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(HomeFanWidget.routeName);
                  },
                  child: Icon(
                    Icons.home_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              if (widget!.index == 0)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(HomeFanWidget.routeName);
                  },
                  child: Icon(
                    Icons.home_filled,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget!.index != 1)
                Icon(
                  Icons.bookmark_border,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (widget!.index == 1)
                Icon(
                  Icons.bookmark_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget!.index != 2)
                Icon(
                  Icons.person_outline,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (widget!.index == 2)
                Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
