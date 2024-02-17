// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:simple_bloc/data/datasources/auth_remote_datasource.dart';
import 'package:simple_bloc/data/models/request/register_request_model.dart';

import '../datasources/auth_datasource.dart';
import '../models/response/register_response_model.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({AuthDataSource? authDataSource})
      : authDataSource = authDataSource ?? AuthRemoteDatasource();

  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    return await authDataSource.register(model);
  }
}
