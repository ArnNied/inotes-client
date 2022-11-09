import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  Future<http.Response> getNote(String session, String noteId) async {
    return await Requests().get(
      endpoint: "/note/$noteId",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  Future<http.Response> getNotes(String session) async {
    return await Requests().get(
      endpoint: "/note",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  Future<http.Response> createNote(
      String session, String title, String body) async {
    return await Requests().post(
      endpoint: "/note",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "title": title,
        "body": body,
      }),
    );
  }

  Future<http.Response> updateNote(
      String session, String noteId, String title, String body) async {
    return await Requests().put(
      endpoint: "/note/$noteId",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "title": title,
        "body": body,
      }),
    );
  }

  Future<http.Response> deleteNote(String session, String noteId) async {
    return await Requests().delete(
      endpoint: "/note/$noteId",
      headers: {
        HttpHeaders.authorizationHeader: session,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }
}
