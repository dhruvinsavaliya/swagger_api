import 'dart:convert';
import 'dart:developer';

import 'package:swagger_api/api/model/res_model/TaskResModel.dart';

import '../../utils/api_type.dart';
import '../api_handler/api_handler.dart';
import '../routes/base_services_routes.dart';

class CreateTaskRepo {
  static Future<TaskResModel?> createTaskRepo(
      {Map<String, dynamic>? reqBody}) async {
    Map<String, String> header = {
      "apiKey": "0323c93f-0f41-449d-9e28-65e740ea3df8",
      "Content-Type":"application/json"
    };

    var response = await ApiHandler.apiHandler(
        url: BaseServiceRoutes.basePath,
        apiType: ApiType.aPost,
        header: header,
        reqBody: reqBody);
    if (response != null) {
      return TaskResModel.fromJson(jsonDecode(response));
    } else {
      return null;
    }
  }
}
