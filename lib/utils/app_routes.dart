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
  // ),
  GetPage(
    name: NoConnectionPage.route,
    page: () => NoConnectionPage(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: SplashScreen.route,
    page: () => SplashScreen(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/main_page',
    page: () => MainView(),
    middlewares: [MyMiddelware()],
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 500),
  ),

  // GetPage(
  //   name: '/set-license',
  //   page: () => SetLicense(),
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.cupertino,
  //   transitionDuration: Duration(milliseconds: 500),
  // ),
  // GetPage(
  //   name: '/select-role',
  //   page: () => SelectRole(),
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.cupertino,
  //   transitionDuration: Duration(milliseconds: 500),
  // ),
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