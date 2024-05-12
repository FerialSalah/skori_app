import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../modules/authentication/data/model/user_model.dart';
import '../../modules/authentication/presentation/screens/login_screen.dart';
import '../routes/navigator_push.dart';


class AppStorage {

  static GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static void cachedTenantKey(String value)=> _box.write('tenant', value);
  static void cachedSubDomain(String value)=> _box.write('subDomain', value);

  static void cacheToken(String value)=> _box.write('token', value);
  static void cacheId(int id) => _box.write('id', id);

  static Future<void>  cacheUser(UserModel user) async => await _box.write('user', json.encode(user.toJson()));
  static UserModel get getUserModel => UserModel.fromJson(json.decode(_box.read('user')));

  static String get getToken => _box.read("token");
  static bool get isLogged => _box.hasData('token');

  static void signOut()  {
     // _box.remove("token");
    _box.erase();
    RouteManager.navigateAndPopAll(LoginScreen());
  }

}



