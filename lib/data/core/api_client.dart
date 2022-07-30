import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);
// dynamic is the return type because this can return any type of model
  dynamic get(String path) async {
    final url = Uri.parse(
        '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}');

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
}
