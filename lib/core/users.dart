import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Future<http.Response> updateInfo(
      String session, String email, String firstName, String lastName) async {
    return await Requests().put(
      endpoint: "/user",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      }),
    );
  }

  Future<http.Response> changePassword(
      String session, String oldPassword, String newPassword) async {
    return await Requests().post(
      endpoint: "/user/change-password",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );
  }

  Future<http.Response> deleteAccount(String session) async {
    return await Requests().delete(
      endpoint: "/user",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }
}
