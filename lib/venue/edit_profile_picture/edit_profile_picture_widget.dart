import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_back_btn/c_h_r_d_back_btn_widget.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_picture_model.dart';
export 'edit_profile_picture_model.dart';

class EditProfilePictureWidget extends StatefulWidget {
  const EditProfilePictureWidget({
    super.key,
    required this.profileImage,
    this.venueId,
    this.musicianId,
  });

  final String? profileImage;
  final int? venueId;
  final int? musicianId;

  static String routeName = 'edit_profile_picture';
  static String routePath = '/EditProfilePicture';

  @override
  State<EditProfilePictureWidget> createState() =>
      _EditProfilePictureWidgetState();
}

class _EditProfilePictureWidgetState extends State<EditProfilePictureWidget> {
  late EditProfilePictureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfilePictureModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/profile_pic.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: wrapWithModel(
                              model: _model.cHRDBackBtnModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CHRDBackBtnWidget(
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                btnAction: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Edit Profile',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Expanded(
                          child: Opacity(
                            opacity: 0.0,
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 56.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 186.0,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: 186.0,
                          height: 186.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF01CDD0),
                                Color(0xFF04C8D0),
                                Color(0xFF0EBCD1),
                                Color(0xFF20A7D4),
                                Color(0xFF3A89D8),
                                Color(0xFF6951DC),
                                Color(0xFF8D28E3)
                              ],
                              stops: [0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              width: 3.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 175.0,
                            height: 175.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl:
                                  '${_model.uploadedFileUrl_uploadData1 != null && _model.uploadedFileUrl_uploadData1 != '' ? _model.uploadedFileUrl_uploadData1 : widget!.profileImage}',
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.4, 1.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 100.0,
                            buttonSize: 60.0,
                            fillColor:
                                FlutterFlowTheme.of(context).neutralDark900,
                            icon: Icon(
                              Icons.camera_alt,
                              color: FlutterFlowTheme.of(context).info,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (_model.isDataUploading_uploadData1 == true) {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              FFAppState().errorMessage = '';
                              safeSetState(() {});
                              _model.imagePath1 =
                                  await actions.pickFileWithSizeLimit(
                                context,
                                10.0,
                                'image',
                              );
                              _shouldSetState = true;
                              if (_model.imagePath1 != null &&
                                  (_model.imagePath1?.bytes?.isNotEmpty ??
                                      false)) {
                                {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadData1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var selectedMedia = <SelectedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles =
                                        _model.imagePath1!.bytes!.isNotEmpty
                                            ? [_model.imagePath1!]
                                            : <FFUploadedFile>[];
                                    selectedMedia =
                                        selectedFilesFromUploadedFiles(
                                      selectedUploadedFiles,
                                      storageFolderPath:
                                          FFAppState().userType == Type.Musician
                                              ? 'Profile Photo'
                                              : 'pictures',
                                    );
                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName:
                                          FFAppState().userType == Type.Musician
                                              ? 'musician'
                                              : 'venueC',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    _model.isDataUploading_uploadData1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadData1 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadData1 =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                if (_model.uploadedFileUrl_uploadData1 !=
                                        null &&
                                    _model.uploadedFileUrl_uploadData1 != '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Success',
                                        style: GoogleFonts.montserrat(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );
                                  await deleteSupabaseFileFromPublicUrl(
                                      widget!.profileImage!);
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Error',
                                        style: GoogleFonts.montserrat(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if (FFAppState().errorMessage != null &&
                                    FFAppState().errorMessage != '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFAppState().errorMessage,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                          ),
                        ),
                        if (_model.isDataUploading_uploadData1)
                          Align(
                            alignment: AlignmentDirectional(0.4, 1.0),
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  child: custom_widgets.CustomLoader(
                                    width: 40.0,
                                    height: 40.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ].addToStart(SizedBox(height: 33.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: wrapWithModel(
                model: _model.cHRDLabelBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: CHRDLabelBtnWidget(
                  heading: 'Update',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: _model.uploadedFileUrl_uploadData1 == null ||
                      _model.uploadedFileUrl_uploadData1 == '',
                  onTab: () async {
                    if ((_model.uploadedFileUrl_uploadData1 != null &&
                            _model.uploadedFileUrl_uploadData1 != '') &&
                        (widget!.venueId != null)) {
                      await VenuesTable().update(
                        data: {
                          'venue_photo': _model.uploadedFileUrl_uploadData1,
                          'updated_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          widget!.venueId,
                        ),
                      );
                    } else if ((_model.uploadedFileUrl_uploadData1 != null &&
                            _model.uploadedFileUrl_uploadData1 != '') &&
                        (widget!.musicianId != null)) {
                      await UsersTable().update(
                        data: {
                          'profile_photo': _model.uploadedFileUrl_uploadData1,
                          'updated_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          widget!.musicianId,
                        ),
                      );
                    } else {
                      if (_model.uploadedFileUrl_uploadData1 != null &&
                          _model.uploadedFileUrl_uploadData1 != '') {
                        await UsersTable().update(
                          data: {
                            'profile_photo': _model.uploadedFileUrl_uploadData1,
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            FFAppState().userId,
                          ),
                        );
                      }
                    }

                    context.safePop();
                  },
                ),
              ),
            ),
          ].addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
