import 'dart:async';

import 'package:equatable/equatable.dart';

class BaseException extends Equatable implements Exception {
  final String message;
  final StackTrace? stackTrace;
  const BaseException(this.message, [this.stackTrace]);

  @override
  String toString() => message.toString();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerException extends BaseException {
  final dynamic error;
  final int statusCode;
  final String endPointUrl;
  const ServerException({
    required String message,
    StackTrace? stackTrace,
    required this.error,
    required this.endPointUrl,
    required this.statusCode,
  }) : super(message, stackTrace);
  @override
  List<Object?> get props => [message, stackTrace, error, endPointUrl, statusCode];
}

class AppTimeoutException extends TimeoutException {
  AppTimeoutException(super.message, [super.duration]);
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
