import 'package:dartz/dartz.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class NetworkFailure extends Failure {
  final int statusCode;
  NetworkFailure({required this.statusCode, required String message})
      : super(message: message);
}
