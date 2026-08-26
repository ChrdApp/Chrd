// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

class TimeSliderPicker extends StatefulWidget {
  const TimeSliderPicker({
    Key? key,
    required this.width,
    required this.height,
    required this.isStartTime,
    required this.initialHour,
    required this.initialMinute,
  }) : super(key: key);

  final double width;
  final double height;
  final int initialHour;
  final int initialMinute;
  final bool isStartTime;

  @override
  State<TimeSliderPicker> createState() => _TimeSliderPickerState();
}

class _TimeSliderPickerState extends State<TimeSliderPicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _periodController;

  late int _selectedHour; // 1–12
  late int _selectedMinute; // 0, 5, 10, ... 55
  late bool _isAM;

  bool _isConfirmed = false;
  bool _isCancelled = false;

  final List<int> _hours = List.generate(12, (i) => i + 1); // 1–12
  final List<int> _minutes = List.generate(12, (i) => i * 5); // 0,5,...55
  final List<String> _periods = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();

    DateTime? appStateTime;
    if (widget.isStartTime && FFAppState().startTime != null) {
      appStateTime = FFAppState().startTime;
    } else if (!widget.isStartTime && FFAppState().endTime != null) {
      appStateTime = FFAppState().endTime;
    } else if (!widget.isStartTime && FFAppState().startTime != null) {
      // Auto set end time 30 min after start
      appStateTime = FFAppState().startTime!.add(const Duration(minutes: 30));
    }

    if (appStateTime != null) {
      final h24 = appStateTime.hour;
      _isAM = h24 < 12;
      final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
      _selectedHour = h12;
      // Round minute to nearest 5
      final rawMin = appStateTime.minute;
      _selectedMinute = (rawMin / 5).round() * 5;
      if (_selectedMinute >= 60) _selectedMinute = 55;
    } else {
      final h24 = widget.initialHour;
      _isAM = h24 < 12;
      final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
      _selectedHour = h12;
      final rawMin = widget.initialMinute;
      _selectedMinute = (rawMin / 5).round() * 5;
      if (_selectedMinute >= 60) _selectedMinute = 55;
    }

    _hourController = FixedExtentScrollController(
      initialItem: _hours.indexOf(_selectedHour).clamp(0, 11),
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _minutes.indexOf(_selectedMinute).clamp(0, 11),
    );
    _periodController = FixedExtentScrollController(
      initialItem: _isAM ? 0 : 1,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  /// Converts selected 12h values to a DateTime
  DateTime getSelectedTime() {
    final now = DateTime.now();
    int hour24;
    if (_isAM) {
      hour24 = _selectedHour == 12 ? 0 : _selectedHour;
    } else {
      hour24 = _selectedHour == 12 ? 12 : _selectedHour + 12;
    }
    return DateTime(now.year, now.month, now.day, hour24, _selectedMinute);
  }

  /// For end time: if it's before start time, assume next day
  DateTime getEndTimeAdjusted() {
    final base = getSelectedTime();
    final startTime = FFAppState().startTime;
    if (startTime != null && base.isBefore(startTime)) {
      return base.add(const Duration(days: 1));
    }
    return base;
  }

  bool _isEndTimeValid() {
    if (widget.isStartTime) return true;
    final startTime = FFAppState().startTime;
    if (startTime == null) return true;
    return getEndTimeAdjusted().isAfter(startTime);
  }

  Widget _buildWheelPicker<T>({
    required List<T> items,
    required FixedExtentScrollController controller,
    required Function(int) onSelectedItemChanged,
    required String label,
    required T selectedValue,
    required String Function(T) displayText,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B2BE3).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF8B2BE3).withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                ),
                ListWheelScrollView.useDelegate(
                  controller: controller,
                  itemExtent: 52,
                  perspective: 0.003,
                  diameterRatio: 1.5,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: onSelectedItemChanged,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: items.length,
                    builder: (context, index) {
                      final value = items[index];
                      final isSelected = value == selectedValue;
                      return Center(
                        child: Text(
                          displayText(value),
                          style: TextStyle(
                            fontSize: isSelected ? 34 : 24,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF8B2BE3), width: 2),
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // HOUR
                  _buildWheelPicker<int>(
                    items: _hours,
                    controller: _hourController,
                    label: 'HOUR',
                    selectedValue: _selectedHour,
                    displayText: (v) => v.toString().padLeft(2, '0'),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedHour = _hours[index];
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  // MINUTE
                  _buildWheelPicker<int>(
                    items: _minutes,
                    controller: _minuteController,
                    label: 'MINUTE',
                    selectedValue: _selectedMinute,
                    displayText: (v) => v.toString().padLeft(2, '0'),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedMinute = _minutes[index];
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  // AM/PM
                  _buildWheelPicker<String>(
                    items: _periods,
                    controller: _periodController,
                    label: 'PERIOD',
                    selectedValue: _isAM ? 'AM' : 'PM',
                    displayText: (v) => v,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _isAM = index == 0;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Validation message
          if (!widget.isStartTime && !_isEndTimeValid())
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text(
                'End time must be after start time',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          // Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade800, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isCancelled = true;
                      _isConfirmed = false;
                    });
                    Navigator.pop(context, null);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: !widget.isStartTime && !_isEndTimeValid()
                      ? null
                      : () {
                          setState(() {
                            _isConfirmed = true;
                            _isCancelled = false;
                          });

                          if (widget.isStartTime) {
                            final returnTime = getSelectedTime();
                            FFAppState().update(() {
                              FFAppState().startTime = returnTime;
                              FFAppState().endTime = null;
                            });
                          } else {
                            final returnTime = getEndTimeAdjusted();
                            FFAppState().update(() {
                              FFAppState().endTime = returnTime;
                            });
                          }

                          Navigator.pop(context);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !widget.isStartTime && !_isEndTimeValid()
                        ? Colors.grey.shade700
                        : const Color(0xFF8B2BE3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
