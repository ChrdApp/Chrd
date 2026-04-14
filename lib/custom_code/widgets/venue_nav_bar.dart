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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'index.dart';
import '/index.dart';
import 'package:google_fonts/google_fonts.dart';

class VenueNavBar extends StatefulWidget {
  const VenueNavBar({
    super.key,
    this.width,
    this.height,
    required this.currentIndex,
  });

  final double? width;
  final double? height;
  final int currentIndex;

  @override
  State<VenueNavBar> createState() => _VenueNavBarState();
}

class _VenueNavBarState extends State<VenueNavBar> {
  int currentIndex = 0;

  // ✅ Pages list
  List<Widget> pages = [
    HomeVWidget(),
    VenueDiscoverWidget(),
    VenuePlannerWidget(),
    VenueMessagesWidget(),
    VenuesWidget(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    WidgetsBinding.instance.addPostFrameCallback((t) {
      listenForNewBannerNotifications(context);
    });
  }

  static const _selectedIcons = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ad6e4rd2ys9x/homeS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/i42ezbxgx6ed/discoverS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ay52brlhm14v/plannerS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/tl457j8a8jb1/GigSelctedIcon.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ydcu74urom3k/venueS.png',
  ];

  static const _unselectedIcons = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/u5n9op3jss12/homeU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/pko0k9jteaao/discoverU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ne5uy0247uw8/plannerU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/zuzlpfie35sw/ThreadOpenIconpng.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ydcu74urom3k/venueS.png',
  ];

  static const _labels = [
    'home',
    'discover',
    'planner',
    'gig threads',
    'venues',
  ];

  static const _iconSizes = [
    [30.0, 30.0],
    [30.0, 30.0],
    [25.0, 25.0],
    [30.0, 27.0],
    [30.0, 30.0],
  ];

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= pages.length) currentIndex = 0;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(5, (index) => _buildNavItem(index)),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = index == currentIndex;
    final iconUrl =
        isSelected ? _selectedIcons[index] : _unselectedIcons[index];
    final double iconW = _iconSizes[index][0];
    final double iconH = _iconSizes[index][1];

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
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                iconUrl,
                width: iconW,
                height: iconH,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              _labels[index],
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                letterSpacing: 0.0,
                color: FlutterFlowTheme.of(context).bodyMedium.color,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
