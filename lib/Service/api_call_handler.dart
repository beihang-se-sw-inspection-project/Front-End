import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:report_app/Model/error_res.dart';

import 'error_throwable.dart';

class ApiCallHandler<T> {
  final Completer<T> _completer = Completer();
  final Future<T> _caller;

  ApiCallHandler(this._caller);

  Future<T> execute() {
    _caller.then(_completer.complete).catchError(
          (error) {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              _completer.completeError(
                ErrorThrowable(
                  ErrorThrowable.NETWORK_ERROR,
                  message: "Connection error",
                ),
              );
              break;
            case DioErrorType.other:
              if (error.error is SocketException) {
                _completer.completeError(
                  ErrorThrowable(
                    ErrorThrowable.NETWORK_ERROR,
                    message: "Connection error",
                  ),
                );
              } else {
                _completer.completeError(
                  ErrorThrowable(
                    ErrorThrowable.INTERNAL_DATA_OPERATION_ERROR,
                    message: "Connection error",
                  ),
                );
              }
              break;
            case DioErrorType.response:
              final retError = ErrorThrowable(error.response?.statusCode);
              retError.message = error.response?.statusMessage;
              if (retError.code != null && retError.code! > 299) {
                retError.errorRes = ErrorRes.fromJson(error.response?.data);
              }
              _completer.completeError(retError);
              break;
            case DioErrorType.cancel:
              break;
          }
        } else {
          debugPrint("ERROR: ${error.toString()}");
          // handle other error
        }
      },
    );
    return _completer.future;
  }
}
