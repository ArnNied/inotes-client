import 'package:http/http.dart' as http;

class Requests {
  final String _baseUrl = "http://localhost:8080";

  Future<http.Response> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    return await http.get(Uri.parse(_baseUrl + endpoint), headers: headers);
  }

  Future<http.Response> post({
    required String endpoint,
    Map<String, String>? headers,
    String? body,
  }) async {
    return await http.post(Uri.parse(_baseUrl + endpoint),
        headers: headers, body: body);
  }

  Future<http.Response> put({
    required String endpoint,
    Map<String, String>? headers,
    String? body,
  }) async {
    return await http.put(Uri.parse(_baseUrl + endpoint),
        headers: headers, body: body);
  }

  Future<http.Response> delete({
    required String endpoint,
    Map<String, String>? headers,
    String? body,
  }) async {
    return await http.delete(Uri.parse(_baseUrl + endpoint),
        headers: headers, body: body);
  }

  Future<http.Response> patch({
    required String endpoint,
    Map<String, String>? headers,
    String? body,
  }) async {
    return await http.patch(Uri.parse(_baseUrl + endpoint),
        headers: headers, body: body);
  }
}
