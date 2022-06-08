// ignore_for_file: avoid_print, unnecessary_new

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/api/api_rest.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_request.dart';
import 'package:wincoremobile/domain/model/transInbox/trans_inbox_response.dart';

class TransInboxRepository {
  final Dio _dio = Dio();

  Future<Either<String, TransInboxResponse>> getTransInbox({
    required String token,
    required TransInboxRequest inboxRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + inboxRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.transInbox().toString(),
        data: jsonDecode(jsonEncode({"message": jsonEncode(inboxRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      TransInboxResponse inboxResponse =
          TransInboxResponse.fromJson(_response.data);
      print(inboxResponse.status);

      //right itu untuk sukses
      return right(inboxResponse);
    } on DioError catch (e) {
      print("status code : ");
      print(e.response?.statusCode);
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          break;
        case DioErrorType.other:
          // Dio Error Handler
          break;
      }
      return left("dio error : " + errorMessage.toString());
    }
  }
}
