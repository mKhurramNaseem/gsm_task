import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

abstract class ApiService{
  String get baseUrl => 'https://fcm.googleapis.com';
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  Future<bool> postNotification({required Map<String , dynamic> body , required Map<String , String> header}) async{
    final response = await post(Uri.parse(url),body: jsonEncode(body),headers: header);
    log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${response.body}');
    log('/////////////////////////////////////////////////////////////${response.statusCode}');
    return response.statusCode == 200;
  }
}