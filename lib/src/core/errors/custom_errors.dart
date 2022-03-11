abstract class CustomErrors {
  final String message;

  CustomErrors({required this.message});
}

class NetworkError extends CustomErrors {
  NetworkError({required String message}) : super(message: message);
}

class LoginError extends CustomErrors {
  LoginError({required String message}) : super(message: message);
}
