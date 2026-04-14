import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/musician/components/c_h_r_d_label_btn/c_h_r_d_label_btn_widget.dart';
import '/musician/components/c_h_r_d_label_column_text/c_h_r_d_label_column_text_widget.dart';
import '/venue/venue_pages/venue_onbording/venue_components/c_h_r_d_app_bar2/c_h_r_d_app_bar2_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'venue_profile_pic4_model.dart';
export 'venue_profile_pic4_model.dart';

class VenueProfilePic4Widget extends StatefulWidget {
  const VenueProfilePic4Widget({super.key});

  static String routeName = 'venue_profile_pic4';
  static String routePath = '/venueProfilePic4';

  @override
  State<VenueProfilePic4Widget> createState() => _VenueProfilePic4WidgetState();
}

class _VenueProfilePic4WidgetState extends State<VenueProfilePic4Widget> {
  late VenueProfilePic4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VenueProfilePic4Model());

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
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 19.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDAppBar2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDAppBar2Widget(
                        step: FFAppState().userType == Type.Musician ? 1 : 2,
                        skip: 'skip',
                        progressValue:
                            FFAppState().userType == Type.Musician ? 0.25 : 0.2,
                        hideSkipButton: FFAppState().userType == Type.Musician
                            ? true
                            : false,
                        count: FFAppState().userType == Type.Musician ? 6 : 8,
                        isEdit: false,
                        onNavBack: () async {
                          context.safePop();
                        },
                        onSkip: () async {
                          if (_model.uploadedFileUrl_uploadData != null &&
                              _model.uploadedFileUrl_uploadData != '') {
                            await deleteSupabaseFileFromPublicUrl(
                                _model.uploadedFileUrl_uploadData);
                          }

                          context.pushNamed(AddVenueContent5Widget.routeName);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.cHRDLabelColumnTextModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHRDLabelColumnTextWidget(
                        heading: 'Set your profile pic',
                        subHeading: FFAppState().userType == Type.Musician
                            ? ' '
                            : 'This is what people see on your profile',
                      ),
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
                            child: Image.network(
                              valueOrDefault<String>(
                                '${FFAppState().venueProfilePic}',
                                'https://kasnaqcqfuqnfydsjvpy.supabase.co/storage/v1/object/public/venueC/loginGradient.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (!_model.isDataUploading_uploadData)
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
                              onPressed: _model.isDataUploading_uploadData
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      if (_model.isDataUploading_uploadData ==
                                          true) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Current uploading is under process.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        _model.imagePath =
                                            await actions.pickFileWithSizeLimit(
                                          5.0,
                                          'image',
                                        );
                                        _shouldSetState = true;
                                        if (_model.imagePath != null &&
                                            (_model.imagePath?.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadData =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .imagePath!
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.imagePath!]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath:
                                                    FFAppState().userType ==
                                                            Type.Musician
                                                        ? 'Profile Photo'
                                                        : 'pictures',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName:
                                                    FFAppState().userType ==
                                                            Type.Musician
                                                        ? 'musician'
                                                        : 'venueC',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading_uploadData =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadData =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadData =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (_model.uploadedFileUrl_uploadData !=
                                                  null &&
                                              _model.uploadedFileUrl_uploadData !=
                                                  '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Success',
                                                  style: GoogleFonts.montserrat(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            );
                                            await deleteSupabaseFileFromPublicUrl(
                                                FFAppState().venueProfilePic);
                                            FFAppState().venueProfilePic =
                                                _model
                                                    .uploadedFileUrl_uploadData;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Error',
                                                  style: GoogleFonts.montserrat(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 3000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                            ),
                          ),
                        if (_model.isDataUploading_uploadData)
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
                  heading: 'Next',
                  txtColor: FlutterFlowTheme.of(context).primaryText,
                  btnColor: FlutterFlowTheme.of(context).primaryViolet,
                  borderColor: FlutterFlowTheme.of(context).primaryViolet,
                  hight: 45.0,
                  headingFontSize: 14,
                  isDisiable: FFAppState().venueProfilePic == null ||
                      FFAppState().venueProfilePic == '',
                  onTab: () async {
                    if (FFAppState().userType == Type.Musician) {
                      _model.userImageUploaded = await UsersTable().update(
                        data: {
                          'profile_photo': _model.uploadedFileUrl_uploadData,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          FFAppState().userId,
                        ),
                        returnRows: true,
                      );

                      context.goNamed(MusicianAccountInfoWidget.routeName);
                    } else {
                      FFAppState().updateVenueAccountCreateStruct(
                        (e) =>
                            e..venuePhoto = _model.uploadedFileUrl_uploadData,
                      );
                      FFAppState().venueProfilePic = '';

                      context.pushNamed(AddVenueContent5Widget.routeName);
                    }

                    safeSetState(() {});
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
