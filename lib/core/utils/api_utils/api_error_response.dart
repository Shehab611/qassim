class ErrorResponse {
  Map<String,dynamic>? errors;

  ErrorResponse({this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = {};
      json['errors'].forEach((String k,v) {
      errors!.putIfAbsent(k, () => v);
      });
    }
  }

}

