import 'package:Akash/data/model/auth/auth_model.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class AuthState extends Equatable {
  final AuthModel ? authData;
  final DioException ? error;

  const AuthState({this.authData,this.error});

  @override
  List<Object> get props => [authData!, error!];
}
class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthCompletedState extends AuthState {
  const AuthCompletedState(AuthModel authData) : super(authData: authData);
}

class AuthErrorState extends AuthState {
  const AuthErrorState(DioException error) : super(error: error);
}