import 'package:dartz/dartz.dart';
import 'package:simple_bloc/data/models/request/register_request_model.dart';
import 'package:simple_bloc/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

import '../apinetwork.dart';
import 'auth_datasource.dart';

class AuthRemoteDatasource extends AuthDataSource {
  final APINetwork apiNetwork = APINetwork(path: "users");

  @override
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http
        .post(
          Uri.parse(apiNetwork.uri),
          body: model.toJson(),
          headers: apiNetwork.headers,
        )
        .timeout(
          const Duration(seconds: 30),
        );

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return const Left('Register gagal');
    }
  }
}
