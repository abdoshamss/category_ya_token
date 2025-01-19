import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static SharedPreferences? sharedPreferences;
  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
}
var getTo=SharedPref.sharedPreferences?.get("token");