import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/string_constants.dart';
import '../../../setup/app_env_setup.dart';
import 'handle_response.dart';

class ApiClient {
  HandleResponse handleResponse = HandleResponse();
  final appEnvSetup = AppEnvSetup();

  static const timeoutDuration = Duration(seconds: 5);

  Future<dynamic> get(Uri uri) async {
    try {
      String authorizationBearer = 'Bearer ${appEnvSetup.accessToken}';
      var headers = {
        'Authorization': authorizationBearer,
        'Content-Type': 'application/json',
      };
      final response =
          await http.get(uri, headers: headers).timeout(timeoutDuration);
      return handleResponse.handleHttpResponse(response);
    } catch (e) {
      debugPrint('create basket error, $e');
      throw (StringConstants.ksUnknowApiError);
    }
  }

  Future<dynamic> post(Uri uri, Map<String, Map<String, dynamic>> data,
      {bool isDashboard = false}) async {
    try {
      late String authorizationBearer;

      authorizationBearer = 'Bearer ${appEnvSetup.accessToken}';

      var headers = {
        'Authorization': authorizationBearer,
        'Content-Type': 'application/json',
      };
      final body = jsonEncode(data);
      final response = await http
          .post(
            uri,
            body: body,
            headers: headers,
          )
          .timeout(timeoutDuration);
      return handleResponse.handleHttpResponse(response);
    } catch (e) {
      throw (StringConstants.ksUnknowApiError);
    }
  }

  Future<dynamic> getToken(Uri uri, Map<String, String> data) async {
    try {
      final body = jsonEncode(data);
      final response = await http
          .put(
            uri,
            body: body,
          )
          .timeout(timeoutDuration);
      return handleResponse.handleHttpResponse(response);
    } catch (e) {
      throw (StringConstants.ksUnknowApiError);
    }
  }

  Future<String> fetchJWTToken(
      String apiUrl, String username, String password) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['access_token'];
        return token;
      } else {
        return 'fail';
      }
    } catch (e) {
      return 'fail';
    }
  }
}
