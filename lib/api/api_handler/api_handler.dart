import 'dart:convert';
import 'dart:developer';

import 'package:swagger_api/utils/api_type.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static http.Response? response;

  static Future apiHandler(
      {required String url,
      required ApiType apiType,
      Map<String, dynamic>? reqBody,
      Map<String, String>? header}) async {

    try {
      if (apiType == ApiType.aGet) {
        response = await http.get(Uri.parse(url), headers: header);
      } else if (apiType == ApiType.aPost) {
        log('===REQBODY===${jsonEncode(reqBody)}');

        response =
            await http.post(Uri.parse(url), headers: header, body: jsonEncode(reqBody));
      } else if (apiType == ApiType.aPut) {
        response =
            await http.put(Uri.parse(url), headers: header, body: reqBody);
      } else {
        response =
            await http.delete(Uri.parse(url), headers: header, body: reqBody);
      }

      log('===RES===${response!.body}');

      if (response!.statusCode == 200) {
        return response!.body;
      } else if (response!.statusCode == 201) {
        return response!.body;
      } else if (response!.statusCode == 204) {
        return response!.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
