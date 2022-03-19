import 'dart:convert';

import 'package:todolist/utils/Constant.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  final String _url = 'http://127.0.0.1:8000/api/';

  login(data, apiUrl) async {
    //var client = http.Client();
    //client.post();
    return await http.post(
      Uri.parse(_url + apiUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};
}
