import 'package:Akash/data/model/exception/error_model.dart';
import 'package:dio/dio.dart';

import '../helper/constants.dart';

class ExceptionHandler {
  final alreadyRegistered = 400201;
  final userAlreadyVerified = 400220;
  final userUnauthorized = 400401;
  final userNotFound = 400404;
  final invalidOtpCode = 400406;
  final requestForForgotPin = 400408;
  final subIdAndPhoneNotMatched = 400409;
  final noRequestForOtpCode = 400410;
  final noRequestForForgotPin = 400411;
  final phoneNotVerified = 400420;
  final waitForResentOtp = 400421;
  final oldPinNotMatched = 400423;
  final otpHasExpired = 400424;
  final exceededOtpVerificationNumber = 400433;
  final serverError = 500500;

  ErrorModel checkException(DioException ex) {
    var message = "";
    var statusCode = -1;

    switch(ex.type) {
      case DioExceptionType.cancel:
        message = cancelRequest;
        break;
      case DioExceptionType.connectionError:
        message = connectionError;
        break;
      case DioExceptionType.connectionTimeout:
        message = connectionTimeout;
        break;
      case DioExceptionType.sendTimeout:
        message = sendTimeoutError;
        break;
      case DioExceptionType.receiveTimeout:
        message = responseReceiveTimeoutError;
        break;
      case DioExceptionType.badCertificate:
        message = errorMessage;
        break;
      case DioExceptionType.badResponse:
        (statusCode, message) = _checkServerError(ex);
        break;
      case DioExceptionType.unknown:
        message = errorMessage;
        break;
    }

    return ErrorModel(statusCode: statusCode, errorMessage: message);
  }

  (int, String) _checkServerError(DioException ex) {
    var message = ex.message ?? errorMessage;
    var statusCode = ex.response?.statusCode ?? -1;
    return (statusCode, message);
  }

}