import '../utils/api_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppPrefStorageService extends GetxService {
  GetStorage storage;

  AppPrefStorageService(this.storage);

  @override
  void onInit() {
    super.onInit();
    configureDio(token);
  }

// Storing authorization token
  Future<void> deleteToken() async {
    await storage.remove('token');
  }

  Future<void> setToken(String? token) async {
    return await storage.write('token', token);
  }

  set token(token) => storage.write('token', token);
  String? get token => storage.read('token');

// Storing application token
  Future<void> deleteAppToken() async {
    await storage.remove('app_token');
  }

  Future<void> setAppToken(String? token) async {
    return await storage.write('app_token', token);
  }

  set appToken(token) => storage.write('app_token', token);
  String? get appToken => storage.read('app_token');

// Storing user id
  Future<void> deleteId() async {
    await storage.remove('id');
  }

  String? get userId => storage.read('id');

  Future<void> setUserId(String? id) async {
    return await storage.write('id', id);
  }

  set userId(userId) => storage.write('id', userId);

  bool get introSkipped => storage.read('introSkipped') ?? false;

  Future<void> setIntroSkipped(bool introSkipped) async {
    await storage.write('introSkipped', introSkipped);
  }

  bool get audioEnabled => storage.read('audioEnabled') ?? true;

  Future<void> setAudioEnabled(bool audioEnabled) async {
    await storage.write('audioEnabled', audioEnabled);
  }

  Future<void> addCharacter(int groupId, int characterId) async {
    groupId = 0;
    var groupItems = readGroupItems(groupId);
    groupItems.add(characterId);
    await storage.write(_groupKey(groupId), groupItems);
  }

  Set<int> readGroupItems(int groupId) {
    groupId = 0;
    Set<int> list = storage.read(_groupKey(groupId)) ?? {};
    return list;
  }

  String _groupKey(int groupId) {
    return "character_group_key_$groupId";
  }

  Future<void> setAppRole({String? appRole}) async {
    return storage.write('app_role', appRole);
  }

  String? get appRole => storage.read('app_role');
  Future<void> deleteAppRole() async {
    await storage.remove('app_role');
  }

  Future<void> setAppType({String? appType}) async {
    return storage.write('app_type', appType);
  }

  String? get appType => storage.read('app_type');

  Future<void> deleteAppType() async {
    await storage.remove('app_type');
  }
}
