import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavPageWidget() : SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavPageWidget()
              : SplashScreenWidget(),
        ),
        FFRoute(
          name: Onbording3Widget.routeName,
          path: Onbording3Widget.routePath,
          builder: (context, params) => Onbording3Widget(),
        ),
        FFRoute(
          name: AccountCreation6Widget.routeName,
          path: AccountCreation6Widget.routePath,
          builder: (context, params) => AccountCreation6Widget(),
        ),
        FFRoute(
          name: EditMusicianProfileWidget.routeName,
          path: EditMusicianProfileWidget.routePath,
          builder: (context, params) => EditMusicianProfileWidget(),
        ),
        FFRoute(
          name: MessagePageWidget.routeName,
          path: MessagePageWidget.routePath,
          builder: (context, params) => MessagePageWidget(),
        ),
        FFRoute(
          name: ContractBoardWidget.routeName,
          path: ContractBoardWidget.routePath,
          builder: (context, params) => ContractBoardWidget(),
        ),
        FFRoute(
          name: DiscoverWidget.routeName,
          path: DiscoverWidget.routePath,
          builder: (context, params) => DiscoverWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: LoginSecurityWidget.routeName,
          path: LoginSecurityWidget.routePath,
          builder: (context, params) => LoginSecurityWidget(
            userData: params.getParam<UsersRow>(
              'userData',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: SplashScreen1Widget.routeName,
          path: SplashScreen1Widget.routePath,
          builder: (context, params) => SplashScreen1Widget(),
        ),
        FFRoute(
          name: SplashScreen2Widget.routeName,
          path: SplashScreen2Widget.routePath,
          builder: (context, params) => SplashScreen2Widget(),
        ),
        FFRoute(
          name: VenueBankAccountWidget.routeName,
          path: VenueBankAccountWidget.routePath,
          builder: (context, params) => VenueBankAccountWidget(),
        ),
        FFRoute(
          name: MusicianBankAccountWidget.routeName,
          path: MusicianBankAccountWidget.routePath,
          builder: (context, params) => MusicianBankAccountWidget(),
        ),
        FFRoute(
          name: MusicianAddBandWidget.routeName,
          path: MusicianAddBandWidget.routePath,
          builder: (context, params) => MusicianAddBandWidget(),
        ),
        FFRoute(
          name: VenueSocialMedia6Widget.routeName,
          path: VenueSocialMedia6Widget.routePath,
          builder: (context, params) => VenueSocialMedia6Widget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddAvailableSlotsWidget.routeName,
          path: AddAvailableSlotsWidget.routePath,
          builder: (context, params) => AddAvailableSlotsWidget(
            repertType: params.getParam(
              'repertType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RepeatOverLayWidget.routeName,
          path: RepeatOverLayWidget.routePath,
          builder: (context, params) => RepeatOverLayWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            selected: params.getParam(
              'selected',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: MobileNumber4Widget.routeName,
          path: MobileNumber4Widget.routePath,
          builder: (context, params) => MobileNumber4Widget(),
        ),
        FFRoute(
          name: PhoneOTP5Widget.routeName,
          path: PhoneOTP5Widget.routePath,
          builder: (context, params) => PhoneOTP5Widget(
            number: params.getParam(
              'number',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdminInfo1Widget.routeName,
          path: AdminInfo1Widget.routePath,
          builder: (context, params) => AdminInfo1Widget(),
        ),
        FFRoute(
          name: AddVenues2Widget.routeName,
          path: AddVenues2Widget.routePath,
          builder: (context, params) => AddVenues2Widget(),
        ),
        FFRoute(
          name: VenueAccountInfo3Widget.routeName,
          path: VenueAccountInfo3Widget.routePath,
          builder: (context, params) => VenueAccountInfo3Widget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: VenueProfilePic4Widget.routeName,
          path: VenueProfilePic4Widget.routePath,
          builder: (context, params) => VenueProfilePic4Widget(),
        ),
        FFRoute(
          name: InviteVenueTeamWidget.routeName,
          path: InviteVenueTeamWidget.routePath,
          builder: (context, params) => InviteVenueTeamWidget(),
        ),
        FFRoute(
          name: InviteTeamMemberWidget.routeName,
          path: InviteTeamMemberWidget.routePath,
          builder: (context, params) => InviteTeamMemberWidget(),
        ),
        FFRoute(
          name: AddVenueContent5Widget.routeName,
          path: AddVenueContent5Widget.routePath,
          builder: (context, params) => AddVenueContent5Widget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddPerformanceStages9Widget.routeName,
          path: AddPerformanceStages9Widget.routePath,
          builder: (context, params) => AddPerformanceStages9Widget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddingPerformanceStagesWidget.routeName,
          path: AddingPerformanceStagesWidget.routePath,
          builder: (context, params) => AddingPerformanceStagesWidget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddVenueOpenSlots10Widget.routeName,
          path: AddVenueOpenSlots10Widget.routePath,
          builder: (context, params) => AddVenueOpenSlots10Widget(),
        ),
        FFRoute(
          name: AddingVenueOpenSlotsWidget.routeName,
          path: AddingVenueOpenSlotsWidget.routePath,
          builder: (context, params) => AddingVenueOpenSlotsWidget(
            timeSelected: params.getParam(
              'timeSelected',
              ParamType.String,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            isMusician: params.getParam(
              'isMusician',
              ParamType.bool,
            ),
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueEntertainment7Widget.routeName,
          path: VenueEntertainment7Widget.routePath,
          builder: (context, params) => VenueEntertainment7Widget(
            entertainmentId: params.getParam<int>(
              'entertainmentId',
              ParamType.int,
              isList: true,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            musicianID: params.getParam(
              'musicianID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueGenres8Widget.routeName,
          path: VenueGenres8Widget.routePath,
          builder: (context, params) => VenueGenres8Widget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            genersId: params.getParam<int>(
              'genersId',
              ParamType.int,
              isList: true,
            ),
            musicianID: params.getParam(
              'musicianID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: OpenSlotDashboardWidget.routeName,
          path: OpenSlotDashboardWidget.routePath,
          builder: (context, params) => OpenSlotDashboardWidget(),
        ),
        FFRoute(
          name: VenueDiscoverWidget.routeName,
          path: VenueDiscoverWidget.routePath,
          builder: (context, params) => VenueDiscoverWidget(),
        ),
        FFRoute(
          name: VenuesWidget.routeName,
          path: VenuesWidget.routePath,
          builder: (context, params) => VenuesWidget(),
        ),
        FFRoute(
          name: VenuesProfileViewWidget.routeName,
          path: VenuesProfileViewWidget.routePath,
          builder: (context, params) => VenuesProfileViewWidget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueDetailsOverlayWidget.routeName,
          path: VenueDetailsOverlayWidget.routePath,
          builder: (context, params) => VenueDetailsOverlayWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueOpenSlotsWidget.routeName,
          path: VenueOpenSlotsWidget.routePath,
          builder: (context, params) => VenueOpenSlotsWidget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SelectTalentWidget.routeName,
          path: SelectTalentWidget.routePath,
          builder: (context, params) => SelectTalentWidget(
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            venueName: params.getParam(
              'venueName',
              ParamType.String,
            ),
            venueImage: params.getParam(
              'venueImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SplashScreenWidget.routeName,
          path: SplashScreenWidget.routePath,
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: GigOfferVenueNotesWidget.routeName,
          path: GigOfferVenueNotesWidget.routePath,
          builder: (context, params) => GigOfferVenueNotesWidget(),
        ),
        FFRoute(
          name: GigOfferChooseSlotWidget.routeName,
          path: GigOfferChooseSlotWidget.routePath,
          builder: (context, params) => GigOfferChooseSlotWidget(
            musicianImage: params.getParam(
              'musicianImage',
              ParamType.String,
            ),
            musicinaName: params.getParam(
              'musicinaName',
              ParamType.String,
            ),
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenuePlannerWidget.routeName,
          path: VenuePlannerWidget.routePath,
          builder: (context, params) => VenuePlannerWidget(),
        ),
        FFRoute(
          name: MusicianProfileVenueWidget.routeName,
          path: MusicianProfileVenueWidget.routePath,
          builder: (context, params) => MusicianProfileVenueWidget(
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueMusicianProfilePostsWidget.routeName,
          path: VenueMusicianProfilePostsWidget.routePath,
          builder: (context, params) => VenueMusicianProfilePostsWidget(),
        ),
        FFRoute(
          name: GigOfferChooseVenueWidget.routeName,
          path: GigOfferChooseVenueWidget.routePath,
          builder: (context, params) => GigOfferChooseVenueWidget(
            musicianImage: params.getParam(
              'musicianImage',
              ParamType.String,
            ),
            musicianName: params.getParam(
              'musicianName',
              ParamType.String,
            ),
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
            venueName: params.getParam(
              'venueName',
              ParamType.String,
            ),
            venueImage: params.getParam(
              'venueImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GigOfferChooseDayWidget.routeName,
          path: GigOfferChooseDayWidget.routePath,
          builder: (context, params) => GigOfferChooseDayWidget(),
        ),
        FFRoute(
          name: MusicianAccountInfoWidget.routeName,
          path: MusicianAccountInfoWidget.routePath,
          builder: (context, params) => MusicianAccountInfoWidget(),
        ),
        FFRoute(
          name: Test1Widget.routeName,
          path: Test1Widget.routePath,
          builder: (context, params) => Test1Widget(),
        ),
        FFRoute(
          name: MusicianAddedContentWidget.routeName,
          path: MusicianAddedContentWidget.routePath,
          builder: (context, params) => MusicianAddedContentWidget(),
        ),
        FFRoute(
          name: MusicianAddContentWidget.routeName,
          path: MusicianAddContentWidget.routePath,
          builder: (context, params) => MusicianAddContentWidget(),
        ),
        FFRoute(
          name: VenueMessagesWidget.routeName,
          path: VenueMessagesWidget.routePath,
          builder: (context, params) => VenueMessagesWidget(),
        ),
        FFRoute(
          name: EditProfilePictureWidget.routeName,
          path: EditProfilePictureWidget.routePath,
          builder: (context, params) => EditProfilePictureWidget(
            profileImage: params.getParam(
              'profileImage',
              ParamType.String,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AddVenueContent5CopyWidget.routeName,
          path: AddVenueContent5CopyWidget.routePath,
          builder: (context, params) => AddVenueContent5CopyWidget(),
        ),
        FFRoute(
          name: VenueMusicianReviewsWidget.routeName,
          path: VenueMusicianReviewsWidget.routePath,
          builder: (context, params) => VenueMusicianReviewsWidget(),
        ),
        FFRoute(
          name: VenueReocurringGigChatWidget.routeName,
          path: VenueReocurringGigChatWidget.routePath,
          builder: (context, params) => VenueReocurringGigChatWidget(),
        ),
        FFRoute(
          name: MusicianProfileWidget.routeName,
          path: MusicianProfileWidget.routePath,
          builder: (context, params) => MusicianProfileWidget(),
        ),
        FFRoute(
          name: MusicianProfilePostsWidget.routeName,
          path: MusicianProfilePostsWidget.routePath,
          builder: (context, params) => MusicianProfilePostsWidget(),
        ),
        FFRoute(
          name: MusicianGigOverLayWidget.routeName,
          path: MusicianGigOverLayWidget.routePath,
          builder: (context, params) => MusicianGigOverLayWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            venueOwnerId: params.getParam(
              'venueOwnerId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: LoogedInPageWidget.routeName,
          path: LoogedInPageWidget.routePath,
          builder: (context, params) => LoogedInPageWidget(),
        ),
        FFRoute(
          name: MusicianProfileHighlightsWidget.routeName,
          path: MusicianProfileHighlightsWidget.routePath,
          builder: (context, params) => MusicianProfileHighlightsWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            isVideo: params.getParam(
              'isVideo',
              ParamType.bool,
            ),
            imageVideo: params.getParam(
              'imageVideo',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomeVWidget.routeName,
          path: HomeVWidget.routePath,
          builder: (context, params) => HomeVWidget(),
        ),
        FFRoute(
          name: HomeMWidget.routeName,
          path: HomeMWidget.routePath,
          builder: (context, params) => HomeMWidget(),
        ),
        FFRoute(
          name: AddAvailableSlotWidget.routeName,
          path: AddAvailableSlotWidget.routePath,
          builder: (context, params) => AddAvailableSlotWidget(),
        ),
        FFRoute(
          name: VenueMusicianProfile1Widget.routeName,
          path: VenueMusicianProfile1Widget.routePath,
          builder: (context, params) => VenueMusicianProfile1Widget(
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            isBooked: params.getParam(
              'isBooked',
              ParamType.bool,
            ),
            venueName: params.getParam(
              'venueName',
              ParamType.String,
            ),
            isDiscoverFlow: params.getParam(
              'isDiscoverFlow',
              ParamType.bool,
            ),
            venueImage: params.getParam(
              'venueImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChrdtestWidget.routeName,
          path: ChrdtestWidget.routePath,
          builder: (context, params) => ChrdtestWidget(),
        ),
        FFRoute(
          name: MusicianAddHighlightWidget.routeName,
          path: MusicianAddHighlightWidget.routePath,
          builder: (context, params) => MusicianAddHighlightWidget(),
        ),
        FFRoute(
          name: VenueGigThreadOverlayWidget.routeName,
          path: VenueGigThreadOverlayWidget.routePath,
          builder: (context, params) => VenueGigThreadOverlayWidget(
            gigID: params.getParam(
              'gigID',
              ParamType.int,
            ),
            venueName: params.getParam(
              'venueName',
              ParamType.String,
            ),
            gigName: params.getParam(
              'gigName',
              ParamType.String,
            ),
            isVenue: params.getParam(
              'isVenue',
              ParamType.bool,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MusicianMessagesWidget.routeName,
          path: MusicianMessagesWidget.routePath,
          builder: (context, params) => MusicianMessagesWidget(),
        ),
        FFRoute(
          name: CustomChatVenueWidget.routeName,
          path: CustomChatVenueWidget.routePath,
          builder: (context, params) => CustomChatVenueWidget(
            threadId: params.getParam(
              'threadId',
              ParamType.int,
            ),
            isVenue: params.getParam(
              'isVenue',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: VenueGigContractOverlayWidget.routeName,
          path: VenueGigContractOverlayWidget.routePath,
          builder: (context, params) => VenueGigContractOverlayWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            threadId: params.getParam(
              'threadId',
              ParamType.int,
            ),
            musicianName: params.getParam(
              'musicianName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AcceptDeclineGigOverlayWidget.routeName,
          path: AcceptDeclineGigOverlayWidget.routePath,
          builder: (context, params) => AcceptDeclineGigOverlayWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            threadId: params.getParam(
              'threadId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VenueGigViewOverlayWidget.routeName,
          path: VenueGigViewOverlayWidget.routePath,
          builder: (context, params) => VenueGigViewOverlayWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            threadId: params.getParam(
              'threadId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EditAdminWidget.routeName,
          path: EditAdminWidget.routePath,
          builder: (context, params) => EditAdminWidget(),
        ),
        FFRoute(
          name: EditingVenueOpenSlotsWidget.routeName,
          path: EditingVenueOpenSlotsWidget.routePath,
          builder: (context, params) => EditingVenueOpenSlotsWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ContractBoardVenueViewWidget.routeName,
          path: ContractBoardVenueViewWidget.routePath,
          builder: (context, params) => ContractBoardVenueViewWidget(
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
            musicianName: params.getParam(
              'musicianName',
              ParamType.String,
            ),
            venueId: params.getParam(
              'venueId',
              ParamType.int,
            ),
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ViewSequenceWidget.routeName,
          path: ViewSequenceWidget.routePath,
          builder: (context, params) => ViewSequenceWidget(
            groupId: params.getParam(
              'groupId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NavPageWidget.routeName,
          path: NavPageWidget.routePath,
          builder: (context, params) => NavPageWidget(
            index: params.getParam(
              'index',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: VenueGigContractOverlayCopyWidget.routeName,
          path: VenueGigContractOverlayCopyWidget.routePath,
          builder: (context, params) => VenueGigContractOverlayCopyWidget(
            slotId: params.getParam(
              'slotId',
              ParamType.int,
            ),
            threadId: params.getParam(
              'threadId',
              ParamType.int,
            ),
            musicianName: params.getParam(
              'musicianName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GigOfferChooseSlotCopyWidget.routeName,
          path: GigOfferChooseSlotCopyWidget.routePath,
          builder: (context, params) => GigOfferChooseSlotCopyWidget(
            musicianImage: params.getParam(
              'musicianImage',
              ParamType.String,
            ),
            musicinaName: params.getParam(
              'musicinaName',
              ParamType.String,
            ),
            musicianId: params.getParam(
              'musicianId',
              ParamType.int,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/000_Intro.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
