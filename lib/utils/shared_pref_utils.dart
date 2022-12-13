import 'package:get_storage/get_storage.dart';

class SharedPrefUtils
{

  static GetStorage getStorage = GetStorage();

  static String apiKey = "apiKey";

  static Future setApiKey(String value)async{
    await getStorage.write(apiKey, value);
  }

  static getApiKey()
  {
    return getStorage.read(apiKey) ?? "";
  }
}