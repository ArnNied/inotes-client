import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Future<http.Response> login(String email, String password) async {
    return await Requests().post(
      endpoint: "/auth/login",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future<http.Response> register(String email, String password) async {
    return await Requests().post(
      endpoint: "/auth/register",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future<http.Response> logout(String sessionHash) async {
    return await Requests().post(
      endpoint: "/auth/logout",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: sessionHash,
      },
    );
  }
}