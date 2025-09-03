import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils{
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init()async{
   return sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> saveData({required String key,required dynamic value}){
    if(value is int){
      return sharedPreferences.setInt(key, value);
    }
    else if(value is double){
      return sharedPreferences.setDouble(key, value);
    }
    else if(value is String){
      return sharedPreferences.setString(key, value);
    }else{
      return sharedPreferences.setBool(key, value);
    }
  }
  static Object? getData({required String key}){
    return sharedPreferences.get(key);
  }
  static Future<bool>removeData(String key){
    return sharedPreferences.remove(key);
  }
}