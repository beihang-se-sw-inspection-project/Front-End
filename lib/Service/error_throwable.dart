
import '../Model/error_res.dart';

class ErrorThrowable implements Exception {
  static const NETWORK_ERROR = 1;
  static const INTERNAL_DATA_OPERATION_ERROR = 2;

  final int? code;
  String? message;
  ErrorRes? errorRes;

  ErrorThrowable(this.code, { this.message, this.errorRes});

  bool get isNetworkError => code == NETWORK_ERROR;

  bool get isInterDataOperationError => code == INTERNAL_DATA_OPERATION_ERROR;

  @override
  String toString() {
    return 'Code : $code, Message : $message';
  }
}
