import 'dart:convert';

import 'package:swagger_api/api/api_handler/api_handler.dart';
import 'package:swagger_api/api/model/res_model/TaskResModel.dart';
import 'package:swagger_api/api/routes/base_services_routes.dart';
import 'package:swagger_api/utils/api_type.dart';

class GetTaskRepo {
  static Future<TaskResModel?> getTaskRepo({required String id}) async {
    Map<String, String> header = {
      "apiKey": "0323c93f-0f41-449d-9e28-65e740ea3df8"
    };

    String url = BaseServiceRoutes.update + id;
    var response = await ApiHandler.apiHandler(
        url: url, apiType: ApiType.aGet, header: header);

    if (response != null) {
      return TaskResModel.fromJson(jsonDecode(response));
    } else {
      return null;
    }
  }
}
