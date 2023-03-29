import '../../repository/app_pref_storage_service.dart';

import '../../constants/api_constants.dart';
import '../../repository/models/models.dart';
import '../../utils/api_utils.dart';
import '../../utils/base_utils.dart';
// import 'package:flutter_getx_auth/models/models.dart';
import 'package:get/get.dart';
import '../../config/globals.dart' as globals;

abstract class AuthenticationService extends GetxService with BaseUtils {
  AppPrefStorageService storageService = Get.find();
  Future<User?> getCurrentUser();
  Future<User> signInWithUsernameAndPassword(
      {required String username, required String password});
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  final _connect = GetConnect();
  @override
  Future<User?> getCurrentUser() async {
    // storageService.deleteToken();
    String? token = storageService.token;
    String? id = storageService.userId;

    configureDio(token);
    if (token != null) {
      globals.token = token;
      await Future.delayed(Duration(seconds: 2));
      // var responseData = await restClient.user("$id");
      // if (!responseData.success!) {
      //   return null;
      // }

      // User user = responseData.object!;
      // if (user.role == null) {
      //   throw AuthenticationException(message: "User hasn't role");
      // }
      // globals.userData = user;
      // return user;
    }
    return null;
  }

  @override
  Future<User> signInWithUsernameAndPassword(
      {required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    var data = {"username": username, "password": password};
    var responseData = await restClient.signIn(data);
    if (!responseData.success!) {
      throw AuthenticationException(message: 'Wrong username or password');
    }

    globals.token = responseData.object['token'];
    User user = User.fromJson(responseData.object["user"]);
    storageService.setToken(responseData.object['token']);
    storageService.setUserId(user.id);
    configureDio(globals.token);
    // globals.userData = user;
    return user;
  }

  @override
  Future<void> signOut() async {
    configureDio(null);
    storageService.deleteToken();
    storageService.deleteId();
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
