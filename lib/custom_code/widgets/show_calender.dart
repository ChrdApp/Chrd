// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowCalender extends StatefulWidget {
  const ShowCalender({
    super.key,
    this.width,
    this.height,
    this.ontap,
    required this.userId,
    required this.type,
    this.selectedDate,
    this.searchText,
    this.venueIds,
    this.slotStatus,
  });

  final double? width;
  final double? height;
  final Future Function()? ontap;
  final int userId;
  final String type;
  final String? selectedDate;
  final String? searchText;
  final List? venueIds;
  final String? slotStatus;

  @override
  State createState() => _ShowCalenderState();
}

class _ShowCalenderState extends State<ShowCalender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<String>> _events = {};
  bool _isLoading = true;

  final String supabaseUrl = 'https://kasnaqcqfuqnfydsjvpy.supabase.co/rest/v1';
  final String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc25hcWNxZnVxbmZ5ZHNqdnB5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc5NjgzODYsImV4cCI6MjA3MzU0NDM4Nn0._SPuU0odn9G5JybVI8r4gzLoDQG6hcYEmeCG-B_8ePs';

  @override
  void initState() {
    super.initState();
    _selectedDay = null;
    _loadCalendarData();
  }

  @override
  void didUpdateWidget(ShowCalender oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.type.toLowerCase() == 'venue') {
      if (oldWidget.searchText != widget.searchText ||
          oldWidget.slotStatus != widget.slotStatus ||
          _listChanged(oldWidget.venueIds, widget.venueIds)) {
        _loadCalendarData();
      }
    }
  }

  bool _listChanged(List? oldList, List? newList) {
    if (oldList == null && newList == null) return false;
    if (oldList == null || newList == null) return true;
    if (oldList.length != newList.length) return true;
    for (int i = 0; i < oldList.length; i++) {
      if (oldList[i] != newList[i]) return true;
    }
    return false;
  }

  Future<void> _loadCalendarData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      dynamic response;

      if (widget.type.toLowerCase() == 'musician') {
        response = await _fetchMusicianData();
      } else if (widget.type.toLowerCase() == 'venue') {
        response = await _fetchVenueData();
      } else {
        response = [];
      }

      _processCalendarData(response);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<dynamic> _fetchMusicianData() async {
    final url = Uri.parse('$supabaseUrl/rpc/get_musician_planner_slots');
    final httpResponse = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $supabaseKey',
        'apikey': supabaseKey,
      },
      body: json.encode({
        'musician_id_param': widget.userId,
        'selected_date': null,
        'search_text': null,
      }),
    );

    if (httpResponse.statusCode == 200) {
      return json.decode(httpResponse.body);
    } else {
      return [];
    }
  }

  Future<dynamic> _fetchVenueData() async {
    final url = Uri.parse('$supabaseUrl/rpc/get_venue_planner_slots');
    final httpResponse = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $supabaseKey',
        'apikey': supabaseKey,
      },
      body: json.encode({
        'venue_owner_id_param': widget.userId,
        'selected_date': widget.selectedDate ?? "",
        'search_text': widget.searchText ?? "",
        'venue_ids': widget.venueIds,
        'slot_status': widget.slotStatus ?? "",
      }),
    );

    if (httpResponse.statusCode == 200) {
      return json.decode(httpResponse.body);
    } else {
      return [];
    }
  }

  void _processCalendarData(dynamic response) {
    _events.clear();

    if (response != null && response is List) {
      for (var dateGroup in response) {
        final dateKeyStr = dateGroup['date_key']?.toString();
        List slotsData = [];

        if (widget.type.toLowerCase() == 'musician') {
          final slots = dateGroup['slots'];
          if (slots != null && slots is List) {
            slotsData = slots;
          }
        } else if (widget.type.toLowerCase() == 'venue') {
          final venues = dateGroup['venues'];
          if (venues != null && venues is List) {
            for (var venue in venues) {
              final venueSlots = venue['slots'];
              if (venueSlots != null && venueSlots is List) {
                slotsData.addAll(venueSlots);
              }
            }
          }
        }

        if (dateKeyStr != null && slotsData.isNotEmpty) {
          final dateKey = DateTime.parse(dateKeyStr);
          final normalizedDate =
              DateTime(dateKey.year, dateKey.month, dateKey.day);

          if (_events[normalizedDate] == null) {
            _events[normalizedDate] = [];
          }

          for (var slot in slotsData) {
            final bookingStatus =
                slot['booking_status']?.toString().toLowerCase();
            if (bookingStatus != null &&
                !_events[normalizedDate]!.contains(bookingStatus)) {
              _events[normalizedDate]!.add(bookingStatus);
            }
          }
        }
      }
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    return _events[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Container(
      width: widget.width,
      height: widget.height,
      color: FlutterFlowTheme.of(context).primaryBackground,
      child: TableCalendar(
        firstDay: today,
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: CalendarFormat.month,
        availableGestures: AvailableGestures.none,
        startingDayOfWeek: StartingDayOfWeek.monday,
        eventLoader: _getEventsForDay,
        onPageChanged: (focusedDay) {
          if (focusedDay.isAfter(today) ||
              (focusedDay.year == today.year &&
                  focusedDay.month == today.month)) {
            setState(() {
              _focusedDay = focusedDay;
            });
          } else {
            setState(() {
              _focusedDay = DateTime(today.year, today.month, 1);
            });
          }
        },
        calendarStyle: CalendarStyle(
          outsideDaysVisible: true,
          defaultTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          weekendTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          outsideTextStyle: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          todayTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          todayDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Color(0x40D9D9D9),
            shape: BoxShape.rectangle,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) {
            return DateFormat.E(locale).format(date)[0];
          },
          weekdayStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          leftChevronVisible: true,
          rightChevronVisible: true,
          leftChevronIcon:
              Icon(Icons.chevron_left, color: Colors.white, size: 28),
          rightChevronIcon:
              Icon(Icons.chevron_right, color: Colors.white, size: 28),
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            final normalizedDate = DateTime(date.year, date.month, date.day);
            final eventList = _events[normalizedDate] ?? [];

            if (eventList.isEmpty) return const SizedBox();

            return Positioned(
              bottom: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: eventList.map((event) {
                  final color = event.toLowerCase() == 'booked'
                      ? const Color(0xFF8D28E3)
                      : const Color(0xFFFFB140);
                  return Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
        onDaySelected: (selectedDay, focusedDay) async {
          if (isSameDay(_selectedDay, selectedDay)) {
            // Same day tapped again — deselect and clear app state
            setState(() {
              _selectedDay = null;
              _focusedDay = focusedDay;
            });
            FFAppState().update(() {
              FFAppState().selectedCalendarDate = '';
            });
            await widget.ontap?.call();
          } else {
            // New day selected
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            FFAppState().update(() {
              FFAppState().selectedCalendarDate = selectedDay.toIso8601String();
            });
            await widget.ontap?.call();
          }
        },
      ),
    );
  }
}
