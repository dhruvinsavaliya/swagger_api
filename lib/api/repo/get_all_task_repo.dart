import 'dart:convert';
import 'dart:developer';

import 'package:swagger_api/api/api_handler/api_handler.dart';
import 'package:swagger_api/api/routes/base_services_routes.dart';
import 'package:swagger_api/utils/api_type.dart';

import '../model/res_model/TaskResModel.dart';

class GetAllTaskRepo {
  static Future<List<TaskResModel>> getAllTaskRepo() async {
    Map<String, String> header = {
      "apiKey": "0323c93f-0f41-449d-9e28-65e740ea3df8"
    };
    var response = await ApiHandler.apiHandler(
        url: BaseServiceRoutes.basePath, apiType: ApiType.aGet, header: header);

    List<TaskResModel> result = List<TaskResModel>.from(
        json.decode(response).map((e) => TaskResModel.fromJson(e)));

    return result;
  }
}
