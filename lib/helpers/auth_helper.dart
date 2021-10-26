import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

  static bool isLogin = false;
  static String loginUserName = "";
  static String loginUserEmail = "";

  static Future saveUserLoggedInSharedPreference(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ISLOGGEDIN", isUserLoggedIn);
    // ignore: avoid_print
    print("saveUserLoggedInSharedPreference");
    getUserLoggedInSharedPreference();
  }

  static Future saveUserNameSharedPreference(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("USERNAMEKEY", userName);
    // ignore: avoid_print
    print("saveUserNameSharedPreference");
    getUserNameSharedPreference();
  }

  static Future saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("USEREMAILKEY", userEmail);
    // ignore: avoid_print
    print("saveUserEmailSharedPreference");
    getUserEmailSharedPreference();
  }

  static getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool("ISLOGGEDIN") ?? false;
    // ignore: avoid_print
    print("getUserLoggedInSharedPreference");
    return isLogin;
  }

  static getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginUserName = prefs.getString("USERNAMEKEY") ?? "";
    // ignore: avoid_print
    print("getUserNameSharedPreference");
    return loginUserName;
  }

  static getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginUserEmail = prefs.getString("USEREMAILKEY") ?? "";
    // ignore: avoid_print
    print("getUserEmailSharedPreference");
    return loginUserEmail;
  }

  static Future deleteSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: avoid_print
    print("deleteSharedPreference");
    prefs.clear();
  }
}
