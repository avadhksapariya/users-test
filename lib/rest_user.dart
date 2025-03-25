import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:users_test/model_user.dart';

class RESTUser {
  Future<List<ModelUser>?> getUserList() async {
    const String tag = "get_user";

    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    log('$tag URL : GET: $url');

    try {
      final response = await http.get(url);
      log('$tag response : ${response.body}');

      final List<dynamic> decodedResult = json.decode(response.body);
      return decodedResult.map((json) => ModelUser.fromJson(json)).toList();
    } catch (e) {
      log('$tag error: ${e.toString()}');
      return null;
    }
  }
}
