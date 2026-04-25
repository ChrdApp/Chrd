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
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

class MusicianNavBar extends StatefulWidget {
  const MusicianNavBar({
    super.key,
    this.width,
    this.height,
    required this.currentIndex,
  });

  final double? width;
  final double? height;
  final int currentIndex;

  @override
  State<MusicianNavBar> createState() => _MusicianNavBarState();
}

class _MusicianNavBarState extends State<MusicianNavBar> {
  int currentIndex = 0;
  bool hasUnreadGigThreads = false;
  bool _iconsCached = false;
  StreamSubscription? _unreadSubscription;

  List<Widget> pages = [
    HomeMWidget(),
    DiscoverWidget(),
    ContractBoardWidget(),
    MusicianMessagesWidget(),
    MusicianProfileWidget(),
  ];

  static const _selectedIcons = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ad6e4rd2ys9x/homeS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/i42ezbxgx6ed/discoverS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ay52brlhm14v/plannerS.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/tl457j8a8jb1/GigSelctedIcon.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/bmqdwk261yrb/profileS.png',
  ];

  static const _unselectedIcons = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/u5n9op3jss12/homeU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/pko0k9jteaao/discoverU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/ne5uy0247uw8/plannerU.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/zuzlpfie35sw/ThreadOpenIconpng.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/c-h-r-d-m-v-p-musician-p-o-v-qiusbj/assets/w89apvu10od2/profileU.png',
  ];

  static const _labels = [
    'home',
    'discover',
    'planner',
    'gig threads',
    'profile',
  ];

  static const _iconSizes = [
    [30.0, 30.0],
    [30.0, 30.0],
    [25.0, 25.0],
    [30.0, 30.0],
    [30.0, 30.0],
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listenForNewBannerNotifications(context);
      _precacheAllIcons();
    });
    _checkUnreadGigThreads();
    _listenForUnreadChanges();
  }

  @override
  void dispose() {
    _unreadSubscription?.cancel();
    super.dispose();
  }

  /// Precache all 10 icons into the image cache on first load
  Future<void> _precacheAllIcons() async {
    final allUrls = [..._selectedIcons, ..._unselectedIcons];
    await Future.wait(
      allUrls.map((url) => precacheImage(
            CachedNetworkImageProvider(url),
            context,
          )),
    );
    if (mounted) {
      setState(() {
        _iconsCached = true;
      });
    }
  }

  Future<void> _checkUnreadGigThreads() async {
    try {
      final userId = FFAppState().userId;
      final result = await SupaFlow.client
          .from('gigs')
          .select('id')
          .eq('musician_id', userId)
          .eq('has_any_thread_message_unread_musician', true);

      if (mounted) {
        setState(() {
          hasUnreadGigThreads = (result as List).isNotEmpty;
        });
      }
    } catch (_) {}
  }

  void _listenForUnreadChanges() {
    final userId = FFAppState().userId;
    _unreadSubscription = SupaFlow.client
        .from('gigs')
        .stream(primaryKey: ['id'])
        .eq('musician_id', userId)
        .listen((data) {
          if (!mounted) return;
          final unreadCount = data
              .where((row) =>
                  row['has_any_thread_message_unread_musician'] == true)
              .length;
          setState(() {
            hasUnreadGigThreads = unreadCount > 0;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= pages.length) currentIndex = 0;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
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
    final bool showDot = index == 3 && hasUnreadGigThreads;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (currentIndex == index) return;
          setState(() {
            currentIndex = index;
          });
          if (index == 3) {
            _checkUnreadGigThreads();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: iconW,
                  height: iconH,
                  child: CachedNetworkImage(
                    imageUrl: iconUrl,
                    width: iconW,
                    height: iconH,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                    placeholder: (context, url) =>
                        SizedBox(width: iconW, height: iconH),
                    errorWidget: (context, url, error) =>
                        SizedBox(width: iconW, height: iconH),
                  ),
                ),
                if (showDot)
                  Positioned(
                    top: -3,
                    right: -3,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B2BE3),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
              ],
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
