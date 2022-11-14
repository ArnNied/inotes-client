import 'dart:io';

import 'requests.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Note {
  Future<http.Response> getNote(String session, String noteId) async {
    return await Requests().get(
      endpoint: "/note/$noteId",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: session,
      },
    );
  }

  Future<http.Response> getNotes(String session) async {
    return await Requests().get(
      endpoint: "/note",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: session,
      },
    );
  }

  Future<http.Response> createNote(
    String session,
    String title,
    String body,
  ) async {
    return await Requests().post(
      endpoint: "/note",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: session,
      },
      body: jsonEncode({
        "title": title,
        "body": body,
      }),
    );
  }

  Future<http.Response> updateNote(
    String session,
    String noteId,
    String title,
    String body,
  ) async {
    return await Requests().put(
      endpoint: "/note/$noteId",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: session,
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
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: session,
      },
    );
  }
}
