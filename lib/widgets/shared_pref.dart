import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String key;

  SharedPref(this.key);

  Future<void> setValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(this.key, value);
  }

  Future<String> getValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(this.key);
  }
}
