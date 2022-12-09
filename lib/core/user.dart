import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  Future<http.Response> getInfo(String session) async {
    return await Requests().get(
      endpoint: "/user",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $session",
      },
    );
  }

  Future<http.Response> updateInfo(
    String session,
    String email,
    String firstName,
    String lastName,
  ) async {
    return await Requests().patch(
      endpoint: "/user",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $session",
      },
      body: jsonEncode({
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      }),
    );
  }

  Future<http.Response> changePassword(
    String session,
    String currentPassword,
    String newPassword,
  ) async {
    return await Requests().post(
      endpoint: "/user/change-password",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $session",
      },
      body: jsonEncode({
        "current_password": currentPassword,
        "new_password": newPassword,
      }),
    );
  }

  Future<http.Response> deleteAccount(String session) async {
    return await Requests().delete(
      endpoint: "/user",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $session",
      },
    );
  }
}
