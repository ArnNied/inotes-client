import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Future<http.Response> login(String email, String password) async {
    return await Requests().post(
      endpoint: "/auth/login",
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future<http.Response> register(String email, String password) async {
    return await Requests().post(
      endpoint: "/auth/register",
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future<http.Response> logout(String session) async {
    return await Requests().post(
      endpoint: "/auth/logout",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $session",
      },
    );
  }

  Future<http.Response> forgotPassword(String email) async {
    return await Requests().post(
      endpoint: "/auth/reset-password",
      body: jsonEncode({
        "email": email,
      }),
    );
  }

  Future<http.Response> confirmForgotPassword(
    String token,
    String newPassword,
  ) async {
    return await Requests().post(
      endpoint: "/auth/reset-password/confirm",
      body: jsonEncode({
        "token": token,
        "new_password": newPassword,
      }),
    );
  }
}
