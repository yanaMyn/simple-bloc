import 'package:dartz/dartz.dart';

import '../models/request/register_request_model.dart';
import '../models/response/register_response_model.dart';
import 'auth_datasource.dart';

class AuthMockDataSource extends AuthDataSource {
  @override
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    Future.delayed(const Duration(seconds: 2));
    final data = RegisterResponseModel(name: "dungdung");
    return Right(data);
  }
}
