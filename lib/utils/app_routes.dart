import 'package:get/get.dart';
import '../features/features.dart';

List<GetPage> pages = [
  // GetPage(
  //   name: IntroPage.route,
  //   page: () => IntroPage(),
  //   binding: IntroBinding(),
  //   transition: Transition.fadeIn,
  //   // middlewares: [
  //   //   IntroMiddleware(),
  //   // ],
  // // ),
  // GetPage(
  //   name: NoConnectionPage.route,
  //   page: () => NoConnectionPage(),
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.cupertino,
  //   transitionDuration: Duration(milliseconds: 500),
  // ),
  GetPage(
    name: SplashScreen.route,
    page: () => SplashScreen(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/main-view',
    page: () => MainView(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login-page',
    page: () => LoginPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/register-page',
    page: () => RegisterPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/application-list',
    page: () => ApplicationListView(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/application-view',
    page: () => ApplicationViewPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/application-create',
    page: () => ApplicationCreatePage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/application-create-finish',
    page: () => ApplicationCreateFinishPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/application-chat',
    page: () => ApplicationChatPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/finish-application',
    page: () => FinishApplication(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/profile-page',
    page: () => ProfilePage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    print(HomeController().isBack);
    HomeController().update();
    return super.onPageCalled(page);
  }
}
