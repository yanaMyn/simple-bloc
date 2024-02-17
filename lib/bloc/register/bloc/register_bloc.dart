import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:simple_bloc/data/datasources/auth_mock_datasource.dart';
import 'package:simple_bloc/data/models/request/register_request_model.dart';
import 'package:simple_bloc/data/models/response/register_response_model.dart';
import 'package:simple_bloc/data/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // Inject with mock
  // final AuthRepository authRepository = AuthRepository(authDataSource: AuthMockDataSource());
  final AuthRepository authRepository = AuthRepository();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonTapped>((event, emit) async {
      emit(RegisterLoading());

      final result = await authRepository.register(event.model);
      result.fold((error) {
        emit(RegisterError(message: error));
      }, (response) {
        emit(RegisterSuccess(model: response));
      });
    });
  }
}
