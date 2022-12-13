import '../../utils/api_type.dart';
import '../api_handler/api_handler.dart';
import '../routes/base_services_routes.dart';

class DeleteNoteRepo
{

  static Future deleteTaskRepo({String? id})async{

    String url = BaseServiceRoutes.update +id!;
    Map<String,String> header =
    {
      "apiKey": "0323c93f-0f41-449d-9e28-65e740ea3df8"
    };
    var response = await ApiHandler.apiHandler(url: url, apiType: ApiType.aDelete,header: header,);

    return response;
  }
}