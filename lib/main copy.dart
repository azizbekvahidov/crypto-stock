import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import './config/theme.dart';
import './features/features.dart';
import './utils/languages.dart';
import './binding/app_init.dart';
import './binding/initial_binding.dart';
import './utils/base_utils.dart';
import './utils/app_routes.dart';
import './repository/app_pref_storage_service.dart';

late bool darkMode;

initialize() async {
  Get.lazyPut(
    () => NoConnectionController(),
  );
  Get.lazyPut(
    () => AuthenticationController(Get.put(FakeAuthenticationService())),
  );
}

void main() async {
  await initialize();
  await initApp();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppPrefStorageService appPrefStorageService =
      Get.put(AppPrefStorageService(GetStorage()));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Mostbyte Order',
      theme: basicTheme(),
      translations: Languages(),
      locale: Locale('uz'),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: true,
      getPages: pages,
      builder: (context, child) {
        return LoaderOverlay(
          disableBackButton: true,
          // overlayWidget: Center(
          //   child: SpinKitThreeBounce
          //     color: AppColors.primaryColor,
          //   ),
          // ),
          child: FlutterEasyLoading(child: child),
        );
      },
      home: MyApp(),
    );
  }
}

class MyApp extends GetWidget<AuthenticationController> with BaseUtils {
  MyApp({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.state is UnAuthenticated) {
        return MainView();
        // LoginPage();
      }

      if (controller.state is Authenticated) {
        return Container();
      }
      return SplashScreen();
    });
  }
}
