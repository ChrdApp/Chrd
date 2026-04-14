// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

/// Helper function to round down to nearest 15-minute interval
DateTime _roundDownTo15Minutes(DateTime dateTime) {
  int minutes = dateTime.minute;
  int roundedMinutes = (minutes ~/ 15) * 15;

  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    dateTime.hour,
    roundedMinutes,
  );
}

/// Helper function to round down minute value to nearest 15-minute interval
int _roundDownTo15MinutesValue(int minutes) {
  return (minutes ~/ 15) * 15;
}

Future<DateTime?> showConstrainedTimePicker(
  BuildContext context,
  DateTime maxDateTime,
  DateTime? initialTime,
) async {
  // Calculate default time - the last valid 15-min slot BEFORE maxDateTime
  DateTime defaultTime;

  // Round down maxDateTime to nearest 15-min interval
  DateTime roundedMax = _roundDownTo15Minutes(maxDateTime);

  // Check if rounded max equals maxDateTime (e.g., 10:00, 10:15, etc.)
  if (roundedMax.isAtSameMomentAs(maxDateTime)) {
    // Max is exactly on a 15-min interval, so go back 15 minutes
    defaultTime = maxDateTime.subtract(const Duration(minutes: 15));
  } else {
    // Max is between intervals (e.g., 10:07), use the rounded down time
    defaultTime = roundedMax;
  }

  // If initialTime is provided, validate and use it if it's valid
  if (initialTime != null) {
    DateTime roundedInitial = _roundDownTo15Minutes(initialTime);
    // Must be before maxDateTime to be valid
    if (roundedInitial.isBefore(maxDateTime)) {
      defaultTime = roundedInitial;
    }
  }

  DateTime? selectedDateTime = defaultTime;

  await showModalBottomSheet<bool>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final _cupertinoTheme = CupertinoTheme.of(context);
      return ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: CupertinoTheme(
            data: _cupertinoTheme.copyWith(
              textTheme: _cupertinoTheme.textTheme.copyWith(
                dateTimePickerTextStyle:
                    FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter Tight',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
              ),
            ),
            child: _ConstrainedCupertinoTimePicker(
              initialDateTime: defaultTime,
              maxDateTime: maxDateTime,
              onDateTimeChanged: (DateTime newDateTime) {
                selectedDateTime = newDateTime;
              },
            ),
          ),
        ),
      );
    },
  );

  // Return the currently selected/focused time
  return selectedDateTime;
}

/// Custom Cupertino Time Picker with 15-minute intervals and max time constraint
class _ConstrainedCupertinoTimePicker extends StatefulWidget {
  final DateTime initialDateTime;
  final DateTime maxDateTime;
  final ValueChanged<DateTime> onDateTimeChanged;

  const _ConstrainedCupertinoTimePicker({
    required this.initialDateTime,
    required this.maxDateTime,
    required this.onDateTimeChanged,
  });

  @override
  State<_ConstrainedCupertinoTimePicker> createState() =>
      _ConstrainedCupertinoTimePickerState();
}

class _ConstrainedCupertinoTimePickerState
    extends State<_ConstrainedCupertinoTimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _periodController;

  late int selectedHour;
  late int selectedMinute;
  late int selectedPeriod; // 0 = AM, 1 = PM

  // Valid minutes (15-minute intervals)
  final List<int> validMinutes = [0, 15, 30, 45];

  // Track which periods are valid
  late List<bool> validPeriods;

  // For infinite scrolling
  static const int _loopMultiplier = 1000;

  @override
  void initState() {
    super.initState();

    // Initialize selected values from initial date time
    selectedHour = widget.initialDateTime.hour % 12;
    if (selectedHour == 0) selectedHour = 12;

    selectedMinute = _roundDownTo15MinutesValue(widget.initialDateTime.minute);
    selectedPeriod = widget.initialDateTime.hour >= 12 ? 1 : 0;

    // Pre-calculate which periods are valid
    validPeriods = [
      _isPeriodValid(0), // AM
      _isPeriodValid(1), // PM
    ];

    // Initialize scroll controllers for infinite scroll
    _hourController = FixedExtentScrollController(
      initialItem: (_loopMultiplier ~/ 2) * 12 + (selectedHour - 1),
    );
    _minuteController = FixedExtentScrollController(
      initialItem: (_loopMultiplier ~/ 2) * validMinutes.length +
          validMinutes.indexOf(selectedMinute),
    );

    // Period controller - fixed 2 items (AM/PM), no cycling
    _periodController = FixedExtentScrollController(
      initialItem: selectedPeriod,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  /// Check if a specific time is valid (must be BEFORE max time, not equal)
  bool _isTimeValid(int hour, int minute, int period) {
    // Convert to 24-hour format
    int hour24 = hour;
    if (hour == 12) {
      hour24 = period == 0 ? 0 : 12;
    } else {
      hour24 = period == 0 ? hour : hour + 12;
    }

    // Create a DateTime for comparison
    final testDateTime = DateTime(
      widget.maxDateTime.year,
      widget.maxDateTime.month,
      widget.maxDateTime.day,
      hour24,
      minute,
    );

    // Check if time is BEFORE max time (not equal, not after)
    return testDateTime.isBefore(widget.maxDateTime);
  }

  /// Check if entire period (AM/PM) is valid
  bool _isPeriodValid(int period) {
    // Check if ANY time in this period is valid
    for (int hour = 1; hour <= 12; hour++) {
      for (int minute in validMinutes) {
        if (_isTimeValid(hour, minute, period)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Get the maximum valid minute for the current hour and period
  int _getMaxValidMinute(int hour, int period) {
    for (int i = validMinutes.length - 1; i >= 0; i--) {
      if (_isTimeValid(hour, validMinutes[i], period)) {
        return validMinutes[i];
      }
    }
    return 0;
  }

  /// Get the last valid hour and minute for a period
  Map<String, int> _getLastValidTimeForPeriod(int period) {
    for (int hour = 12; hour >= 1; hour--) {
      for (int i = validMinutes.length - 1; i >= 0; i--) {
        if (_isTimeValid(hour, validMinutes[i], period)) {
          return {'hour': hour, 'minute': validMinutes[i]};
        }
      }
    }
    return {'hour': 1, 'minute': 0};
  }

  void _onHourChanged(int index) {
    setState(() {
      int newHour = (index % 12) + 1;

      // Check if this hour is valid with current minute
      if (!_isTimeValid(newHour, selectedMinute, selectedPeriod)) {
        // Find the max valid minute for this hour
        int validMinute = _getMaxValidMinute(newHour, selectedPeriod);
        if (validMinute >= 0 &&
            _isTimeValid(newHour, validMinute, selectedPeriod)) {
          selectedHour = newHour;
          selectedMinute = validMinute;
          int currentMinuteIndex = _minuteController.selectedItem;
          int targetMinuteInCycle = validMinutes.indexOf(selectedMinute);
          int cycleStart =
              (currentMinuteIndex ~/ validMinutes.length) * validMinutes.length;
          _minuteController.jumpToItem(cycleStart + targetMinuteInCycle);
          _notifyDateTimeChanged();
        }
        return;
      }

      selectedHour = newHour;

      // Check if current minute is still valid
      int maxMinute = _getMaxValidMinute(selectedHour, selectedPeriod);
      if (selectedMinute > maxMinute) {
        selectedMinute = maxMinute;
        int currentMinuteIndex = _minuteController.selectedItem;
        int targetMinuteInCycle = validMinutes.indexOf(selectedMinute);
        int cycleStart =
            (currentMinuteIndex ~/ validMinutes.length) * validMinutes.length;
        _minuteController.jumpToItem(cycleStart + targetMinuteInCycle);
      }

      _notifyDateTimeChanged();
    });
  }

  void _onMinuteChanged(int index) {
    setState(() {
      int newMinute = validMinutes[index % validMinutes.length];

      // Check if this minute is valid
      if (!_isTimeValid(selectedHour, newMinute, selectedPeriod)) {
        // Don't allow selection of invalid minutes
        return;
      }

      selectedMinute = newMinute;
      _notifyDateTimeChanged();
    });
  }

  void _onPeriodChanged(int index) {
    // Prevent changing to invalid period
    if (!validPeriods[index]) {
      // Snap back to current valid period
      _periodController.jumpToItem(selectedPeriod);
      return;
    }

    setState(() {
      if (!_isPeriodValid(index)) {
        // Snap back to current period
        _periodController.jumpToItem(selectedPeriod);
        return;
      }

      selectedPeriod = index;

      // Get the last valid time for this period
      Map<String, int> lastValidTime =
          _getLastValidTimeForPeriod(selectedPeriod);

      // Set to last valid time in the period
      selectedHour = lastValidTime['hour']!;
      selectedMinute = lastValidTime['minute']!;

      int currentHourIndex = _hourController.selectedItem;
      int targetHourInCycle = selectedHour - 1;
      int cycleStart = (currentHourIndex ~/ 12) * 12;
      _hourController.jumpToItem(cycleStart + targetHourInCycle);

      int currentMinuteIndex = _minuteController.selectedItem;
      int targetMinuteInCycle = validMinutes.indexOf(selectedMinute);
      int minuteCycleStart =
          (currentMinuteIndex ~/ validMinutes.length) * validMinutes.length;
      _minuteController.jumpToItem(minuteCycleStart + targetMinuteInCycle);

      _notifyDateTimeChanged();
    });
  }

  void _notifyDateTimeChanged() {
    // Convert to 24-hour format
    int hour24 = selectedHour;
    if (selectedHour == 12) {
      hour24 = selectedPeriod == 0 ? 0 : 12;
    } else {
      hour24 = selectedPeriod == 0 ? selectedHour : selectedHour + 12;
    }

    final newDateTime = DateTime(
      widget.maxDateTime.year,
      widget.maxDateTime.month,
      widget.maxDateTime.day,
      hour24,
      selectedMinute,
    );

    widget.onDateTimeChanged(newDateTime);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = FlutterFlowTheme.of(context).primaryText;
    final inactiveColor = FlutterFlowTheme.of(context).secondaryText;
    final backgroundColor = FlutterFlowTheme.of(context).secondaryBackground;

    return Stack(
      children: [
        // The pickers
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hour picker
            SizedBox(
              width: 70,
              child: CupertinoPicker.builder(
                scrollController: _hourController,
                itemExtent: 32.0,
                diameterRatio: 1.07,
                squeeze: 1.0,
                useMagnifier: false,
                magnification: 1.0,
                backgroundColor: backgroundColor,
                selectionOverlay: const SizedBox.shrink(),
                onSelectedItemChanged: _onHourChanged,
                itemBuilder: (context, index) {
                  int hour = (index % 12) + 1;
                  bool isSelected = hour == selectedHour;
                  bool isEnabled =
                      _isTimeValid(hour, selectedMinute, selectedPeriod);

                  return Center(
                    child: Text(
                      hour.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isEnabled
                            ? textColor
                            : inactiveColor.withOpacity(0.3),
                        height: 1.2,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Colon separator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                ':',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  height: 1.2,
                ),
              ),
            ),

            // Minute picker
            SizedBox(
              width: 70,
              child: CupertinoPicker.builder(
                scrollController: _minuteController,
                itemExtent: 32.0,
                diameterRatio: 1.07,
                squeeze: 1.0,
                useMagnifier: false,
                magnification: 1.0,
                backgroundColor: backgroundColor,
                selectionOverlay: const SizedBox.shrink(),
                onSelectedItemChanged: _onMinuteChanged,
                itemBuilder: (context, index) {
                  int minute = validMinutes[index % validMinutes.length];
                  bool isSelected = minute == selectedMinute;
                  bool isEnabled =
                      _isTimeValid(selectedHour, minute, selectedPeriod);

                  return Center(
                    child: Text(
                      minute.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isEnabled
                            ? textColor
                            : inactiveColor.withOpacity(0.3),
                        height: 1.2,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 8),

            // AM/PM picker (non-cycling, fixed 2 items)
            SizedBox(
              width: 55,
              child: CupertinoPicker(
                scrollController: _periodController,
                itemExtent: 32.0,
                diameterRatio: 1.07,
                squeeze: 1.0,
                useMagnifier: false,
                magnification: 1.0,
                backgroundColor: backgroundColor,
                selectionOverlay: const SizedBox.shrink(),
                onSelectedItemChanged: (index) {
                  // Prevent changing to invalid period
                  if (!validPeriods[index]) {
                    // Snap back to current valid period
                    _periodController.jumpToItem(selectedPeriod);
                    return;
                  }
                  _onPeriodChanged(index);
                },
                children: ['AM', 'PM'].asMap().entries.map((entry) {
                  bool isEnabled = validPeriods[entry.key];
                  bool isSelected = entry.key == selectedPeriod;
                  String period = entry.value;

                  return Center(
                    child: Text(
                      period,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isEnabled
                            ? textColor
                            : inactiveColor.withOpacity(0.3),
                        height: 1.2,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),

        // Continuous selection overlay
        Positioned.fill(
          child: Center(
            child: IgnorePointer(
              child: Container(
                height: 36.0,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: textColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
