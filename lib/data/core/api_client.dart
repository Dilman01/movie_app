import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);
// dynamic is the return type because this can return any type of model
  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final url = Uri.parse(getPath(path, params));

// Keep headers as JSON because TMDb API will result in JSON format.
    final response = await _client.get(url, headers: {
      'Content-Type': 'application/json',
    });
// Check whether service has given a success response.
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
