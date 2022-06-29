import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:get_storage/get_storage.dart';

class HeaderInterceptor implements RequestInterceptor {
  final box = GetStorage();
  static const String authHeader = "Authorization";
  static const String jwt = "Bearer ";

  @override
  FutureOr<Request> onRequest(Request request) async {
    var user = box.hasData('user') ? await jsonDecode(box.read('user')) : {'token': null};
    String token = user['token'] ?? '';
    Request newRequest = request.copyWith(headers: {
      'Authorization': '$jwt$token',
      'Content-Type': 'application/json'
    });
    return newRequest;
  }
}