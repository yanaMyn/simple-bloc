part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterButtonTapped extends RegisterEvent {
  final RegisterRequestModel model;

  RegisterButtonTapped({required this.model});
}
