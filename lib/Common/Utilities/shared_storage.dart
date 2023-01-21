import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path;

var prefs;

class SharedStorage {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;

    return _prefsInstance!;
  }

  static initDB() async {
    Directory appDocDir = await path.getApplicationDocumentsDirectory();
    String dbFilePath = [appDocDir.path, 'infinty_box.db'].join('/');
    setString('dbFilePath', dbFilePath);
    // final UserDao _userDao = UserDao();
  }

  static Future<void> cleanDatabase() async {
    try {
      // SharedStorage.setString(AppConstants.loginPojo, '');
      // SharedStorage.setString(AppConstants.accessToken, '');
      // SharedStorage.setString(AppConstants.favlist, '');
      // SharedStorage.setString(AppConstants.couponlist, '');
      // final box = await Hive.openBox<CouponSiteListTable>('coupon_site_list_table');
      // box.deleteFromDisk();
      //  final box1 = await Hive.openBox<CouponDataTable>('CouponDataTable');
      // box1.deleteFromDisk();

      //  UserDao userDao = new UserDao();
      //  userDao.deleteUsers();
      //  CouponDao couponDao = new CouponDao();
      //  couponDao.deleteCoupon();
      //  couponDao.removeCouponCart();
      // // couponDao.removeFavCouponList();
      //  couponDao.removeCouponList();
      //  couponDao.removeSerialCouponList();
      //  couponDao.removeRedeemedCouponList();
      //  couponDao.removeHistoryCouponList();
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String? value) async {
    var prefs = await _instance;
    return prefs.setString(key, value ?? '');
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static Future<bool> clearAll() => _prefsInstance!.clear();
}
