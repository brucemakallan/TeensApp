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
    String value = preferences.getString(this.key) ?? '';
    if (value == '')
      throw Exception("Value matching ${this.key} not found");
    else
      return value;
  }

  Future<void> removeKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(this.key);
  }
}
