import '../authentication/authentication.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  bool isBack = false;
  String title = "";
  @override
  void onInit() async {
    isBack = Get.routing.isBack!;
    print(isBack);
    super.onInit();
    update();
  }

  Future<void> signOut() async {
    _authenticationController.signOut();
  }
}
