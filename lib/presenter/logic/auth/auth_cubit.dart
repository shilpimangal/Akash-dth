import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/constants.dart';
import '../../../core/resources/data_state.dart';
import '../../../data/model/auth/auth_dto.dart';
import '../../../domain/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthInitialState());

  void appAuthentication(AuthDto authDto) async {
    emit(const AuthLoadingState());
    final dataState = await _repository.appAuthentication(authDto);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthCompletedState(dataState.data!));
    } else if (dataState is DataFailed && dataState.error != null) {
      emit(AuthErrorState(dataState.error!));
    } else {
      emit(AuthErrorState(DioException(
          error: errorMessage,
          response: null,
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions())));
    }
  }
}
