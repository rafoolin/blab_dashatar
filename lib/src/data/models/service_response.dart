import 'package:flutter/material.dart';

class ServiceResponse {
  final bool isSuccess;
  final String filePath;

  ServiceResponse({@required this.isSuccess, @required this.filePath});

  @override
  String toString() => 'ServiceResponse(isSuccess: $isSuccess,'
      ' filePath: $filePath)';
}
