// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_request.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class PinjamanDetailRepository {
  final Dio _dio = Dio();

  // Future<>
  Future<Either<String, PinjamanDetailResponse>> getPinjaman({
    required String token,
    required PinjamanDetailRequest pinjamanRequest,
  }) async {
    Response _response;

    try {
      // print("tokennya : " + token);
      // print("json : " + pinjamanRequest.toJson().toString());
      // print("json encoded : " +
      //     jsonDecode(jsonEncode({"message": jsonEncode(pinjamanRequest)}))
      //         .toString());

      _response = await _dio.post(
        ApiRest.accountPinjamanInfo().toString(),
        data: jsonDecode(jsonEncode({"message": jsonEncode(pinjamanRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/LoanInfo",
      //   data: jsonDecode(jsonEncode({"message": jsonEncode(pinjamanRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      PinjamanDetailResponse pinjamanResponse =
          PinjamanDetailResponse.fromJson(_response.data);
      // print(pinjamanResponse.status);

      //right itu untuk sukses
      return right(pinjamanResponse);
    } on DioError catch (e) {
      // print("status code : ");
      // print(e.response?.statusCode);
      // print(e.response?.data);
      // print(e.response?.headers);
      // print(e.response?.requestOptions);
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
