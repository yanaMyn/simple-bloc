import 'package:dartz/dartz.dart';
import 'package:simple_bloc/data/models/response/register_response_model.dart';

import '../models/request/register_request_model.dart';

abstract class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model);
}
