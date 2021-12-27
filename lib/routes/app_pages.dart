import 'package:flutter_donor/ui/event/event_search_page.dart';
import 'package:flutter_donor/ui/forgot_pass/forgot_pass_page.dart';
import 'package:flutter_donor/ui/location/location_filter_page.dart';
import 'package:flutter_donor/ui/main/main_feature.dart';
import 'package:get/get.dart';

import '../ui/donor/donor_page.dart';
import '../ui/event/event_detail_page.dart';
import '../ui/event/event_page.dart';
import '../ui/faq/faq_page.dart';
import '../ui/history/subpages/donor_detail_page.dart';
import '../ui/history/subpages/submission_detail_page.dart';
import '../ui/home/home_page.dart';
import '../ui/home/section/webview_article_page.dart';
import '../ui/location/location_maps_page.dart';
import '../ui/location/location_page.dart';
import '../ui/login/login_page.dart';
import '../ui/main/main_feature.dart';
import '../ui/main/main_page.dart';
import '../ui/onboarding/onboarding_page.dart';
import '../ui/profile/profile_edit_identity/profile_edit_identity_page.dart';
import '../ui/profile/profile_main/profile_page.dart';
import '../ui/register/register_3_page.dart';
import '../ui/register/register_page.dart';
import '../ui/request/request_page.dart';
import '../ui/splashscreen/splash_screen_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      children: [
        GetPage(
          name: Routes.profileEditIdentity,
          page: () => const ProfileEditIdentityPage(),
        ),
      ],
    ),
    GetPage(
      name: Routes.location,
      page: () => LocationPage(),
    ),
    GetPage(
      name: Routes.showMaps,
      page: () => const LocationMapsPage(),
    ),
    GetPage(
      name: Routes.event,
      page: () => EventPage(),
    ),
    GetPage(
      name: Routes.event + "/:id?",
      page: () => EventDetailPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
    ),
    // GetPage(
    //   name: Routes.register2,
    //   page: () => const RegisterPage2(),
    // ),
    GetPage(
      name: Routes.register3,
      page: () => RegisterPage3(),
    ),
    GetPage(
      name: Routes.mainFeature,
      page: () => MainFeaturePage(),
    ),
    GetPage(
      name: Routes.donor,
      page: () => DonorPage(),
    ),
    GetPage(
      name: Routes.request,
      page: () => RequestPage(),
    ),
    GetPage(
      name: Routes.donor,
      page: () => DonorPage(),
    ),
    GetPage(
      name: Routes.onBoarding,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: Routes.faq,
      page: () => FAQPage(),
    ),
    GetPage(
      name: Routes.donorDetail,
      page: () => DonorDetailPage(),
    ),
    GetPage(
      name: Routes.submissionDetail,
      page: () => SubmissionDetailPage(),
    ),
    GetPage(
      name: Routes.webviewArticle,
      page: () => WebviewArticlePage(),
    ),
    GetPage(
      name: Routes.eventSearch,
      page: () => EventSearchPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(microseconds: 200),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPassPage(),
    ),
    GetPage(
      name: Routes.filterInstitutions,
      page: () => LocationFilterPage(),
    ),
  ];
}
