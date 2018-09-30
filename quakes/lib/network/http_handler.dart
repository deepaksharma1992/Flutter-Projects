import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHandler {
  final String title;

  HttpHandler(this.title);

  Future<Map> returnJSONResponse() async {
    String apiUrl = title;
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
}
