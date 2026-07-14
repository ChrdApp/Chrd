import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/upload_file_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/musician_components/musician_nav_bar/musician_nav_bar_widget.dart';
import '/venue/venue_pages/venue_components/c_h_r_d_profile_post/c_h_r_d_profile_post_widget.dart';
import '/venue/venue_pages/venue_onbording/c_h_r_d_image_component/c_h_r_d_image_component_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_video_player_component/c_h_r_d_video_player_component_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'musician_profile_widget.dart' show MusicianProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicianProfileModel extends FlutterFlowModel<MusicianProfileWidget> {
  ///  Local state fields for this page.

  bool isUploading = false;

  bool isTextExpanded = false;

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel1;
  // Model for CHRD_Profile_Post component.
  late CHRDProfilePostModel cHRDProfilePostModel2;
  // Model for uploadFileBtn component.
  late UploadFileBtnModel uploadFileBtnModel1;
  bool isDataUploading_uploadedVideo = false;
  FFUploadedFile uploadedLocalFile_uploadedVideo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedVideo = '';

  // Stores action output result for [Backend Call - Insert Row] action in uploadFileBtn widget.
  HighlightsRow? highlightVideo;
  // Stores action output result for [Backend Call - Insert Row] action in uploadFileBtn widget.
  HighlightsRow? highlightImage;
  // Stores action output result for [Custom Action - pickFileWithSizeLimit] action in AddNewContainer widget.
  FFUploadedFile? imageVideoPathOutput;
  bool isDataUploading_musicianPostsOutput = false;
  FFUploadedFile uploadedLocalFile_musicianPostsOutput =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_musicianPostsOutput = '';

  // Stores action output result for [Custom Action - uploadMediaToSupabase] action in uploadFileBtn widget.
  String? uploadMediaMusicianFIles;
  // Model for musicianNavBar component.
  late MusicianNavBarModel musicianNavBarModel;

  @override
  void initState(BuildContext context) {
    cHRDProfilePostModel1 = createModel(context, () => CHRDProfilePostModel());
    cHRDProfilePostModel2 = createModel(context, () => CHRDProfilePostModel());
    uploadFileBtnModel1 = createModel(context, () => UploadFileBtnModel());
    musicianNavBarModel = createModel(context, () => MusicianNavBarModel());
  }

  @override
  void dispose() {
    cHRDProfilePostModel1.dispose();
    cHRDProfilePostModel2.dispose();
    uploadFileBtnModel1.dispose();
    musicianNavBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
