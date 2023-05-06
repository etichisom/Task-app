import 'dart:async';

import 'package:dio/dio.dart';
import 'package:task/core/constant/api.dart';
import 'package:task/core/error/expection.dart';

import '../constant/constant.dart';



class NetworkService {
  final Dio dio;

  NetworkService({required this.dio});

  Future<Response> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio
          .get(
        baseUrl+path,
        options: Options(
          method: 'GET',
        ),
        queryParameters: query,
      )
          .onError<DioError>((error, stackTrace) =>
      throw CustomException(message: getErrorMessage(error)));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw CustomException(message: response.data['message']);
      }
    } on CustomException {
      rethrow;
    } on DioError catch (error) {
      throw CustomException(message: getErrorMessage(error));
    } catch (error) {
      throw CustomException(message: DEFAULT_ERROR_MSG);
    }
  }

  String getErrorMessage(DioError error) {
    String? message;
    switch (error.type) {
      case DioErrorType.connectionError:
        if (error.message.toString().contains('SocketException')) {
          message = 'Please check your network and try again';
        } else {
          message = DEFAULT_ERROR_MSG;
        }
        break;
      case DioErrorType.badResponse:
        message = "Something went wrong";
        break;
      default:
    }
    return message ?? DEFAULT_ERROR_MSG;
  }
}