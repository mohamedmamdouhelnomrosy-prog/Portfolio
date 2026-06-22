enum ExpectType { object, list, other }

class ErrorMessageModel {
  // final HttpRequestHandler requestApi;
  final Map<String, dynamic>? responseApi;

  final int statusCode;
  final String statusMessage;

  final String? modelName;
  final String? errorMessage;
  final ExpectType? expectType;

  String get statusCodeName => getStatusCodeName(statusCode);

  static String getStatusCodeName(int statusCode) {
    switch (statusCode) {
      case 200:
        return "OK";
      case 201:
        return "Created";
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'forbidden';
      case 404:
        return 'Not Found';
      case 415:
        return 'Unsupported Media Type';
      case 422:
        return 'UnProcessable Entity | Validation Error';
      case 500:
        return 'Internal Server Error';
      case 501:
        return 'Not Implemented';
      case 503:
        return 'Service Unavailable';
      default:
        return "UnExpected Error";
    }
  }

  ErrorMessageModel(
      {required this.statusCode,
      String? statusMessage,
      String? errorMessage,
      this.responseApi})
      : modelName = null,
        expectType = null,
        errorMessage = errorMessage ?? "",
        statusMessage = statusMessage ?? getStatusCodeName(statusCode);

  const ErrorMessageModel.parsing({
    required this.modelName,
    required this.expectType,
    required this.statusMessage,
    required this.errorMessage,
    this.responseApi,
  }) : statusCode = 200;

  ErrorMessageModel.local({
    required this.statusMessage,
    required this.errorMessage,
  })  : statusCode = 200,
        modelName = null,
        expectType = null,
        responseApi = null;

  @override
  String toString() => modelName == null
      ? "API ERROR: statusCode: $statusCode ,message: $statusMessage"
      : "PARSING ERROR: modelName: $modelName";
}
