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

import '/flutter_flow/flutter_flow_widgets.dart';
import 'index.dart'; // Imports other custom widgets

import 'index.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';

class FanNavbar extends StatefulWidget {
  const FanNavbar({
    super.key,
    this.width,
    this.height,
    required this.currentIndex,
  });

  final double? width;
  final double? height;
  final int currentIndex;

  @override
  State<FanNavbar> createState() => _FanNavbarState();
}

class _FanNavbarState extends State<FanNavbar> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeFanWidget(),
    BookamrkedFanWidget(),
    FanUserWidget(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= pages.length) currentIndex = 0;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(3, (index) => _buildNavItem(index)),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Center(
                child: Icon(
                  _getIcon(index, isSelected),
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _labels[index],
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                letterSpacing: 0.0,
                color: Colors.white,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const _labels = ['Home', 'Saved', 'Profile'];

  IconData _getIcon(int index, bool isSelected) {
    switch (index) {
      case 0:
        return isSelected ? Icons.home_rounded : Icons.home_outlined;
      case 1:
        return isSelected
            ? Icons.bookmark_rounded
            : Icons.bookmark_border_rounded;
      case 2:
        return isSelected ? Icons.person_rounded : Icons.person_outline_rounded;
      default:
        return Icons.home_outlined;
    }
  }
}
