import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer {

  Future<bool> setUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('id', user.id!);
    pref.setString('email', user.email!);
    pref.setString('nickname', user.nickname!);
    pref.setString('gender', user.gender!);
    pref.setInt('birth_month', user.userBirth![1]);
    pref.setInt('birth_day', user.userBirth![2]);
    return true;
  }

  Future<int?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt('id');
  }
}