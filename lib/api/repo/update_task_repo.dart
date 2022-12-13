import '../../utils/api_type.dart';
import '../api_handler/api_handler.dart';
import '../routes/base_services_routes.dart';

class UpdateTaskRepo
{
  static Future updateTaskRepo({Map<String,dynamic>? reqBody,String? id})async{

String url = BaseServiceRoutes.update +id!;
    Map<String,String> header =
    {
      "apiKey": "0323c93f-0f41-449d-9e28-65e740ea3df8"
    };
    var response = await ApiHandler.apiHandler(url: url, apiType: ApiType.aPut,header: header,reqBody: reqBody);

    return response;
  }
}