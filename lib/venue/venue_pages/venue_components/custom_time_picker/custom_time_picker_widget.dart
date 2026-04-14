import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_time_picker_model.dart';
export 'custom_time_picker_model.dart';

class CustomTimePickerWidget extends StatefulWidget {
  const CustomTimePickerWidget({
    super.key,
    required this.isStartTime,
  });

  final bool? isStartTime;

  @override
  State<CustomTimePickerWidget> createState() => _CustomTimePickerWidgetState();
}

class _CustomTimePickerWidgetState extends State<CustomTimePickerWidget> {
  late CustomTimePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomTimePickerModel());

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
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 300.0,
            child: custom_widgets.TimeSliderPicker(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: 300.0,
              initialHour: widget!.isStartTime == false
                  ? functions.getHourFromDateTime(FFAppState().startTime)
                  : 10,
              initialMinute: widget!.isStartTime == false
                  ? functions.getMinuteFromDateTime(FFAppState().startTime)
                  : 0,
              isStartTime: widget!.isStartTime!,
            ),
          ),
        ),
      ],
    );
  }
}
