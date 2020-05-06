class CustomError {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  CustomError(this.message);

  @override
  String toString() => message;
}
