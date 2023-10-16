import 'dart:convert';
import 'dart:io';

import 'package:Akash/data/model/auth/auth_model.dart';
import 'package:dio/dio.dart';

import '../../../core/helper/constants.dart';
import '../../../core/helper/preference_manager.dart';
import '../../../core/resources/data_state.dart';
import '../../../di/injection_container.dart';
import '../../../domain/auth_repository.dart';
import '../../model/auth/auth_dto.dart';
import '../../services/auth/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service;
  AuthRepositoryImpl(this._service);

  @override
  Future<DataState<AuthModel>> appAuthentication(AuthDto authDto) async {
    try {
      Response response = await _service.appAuthentication(authDto);
      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> data = jsonDecode(response.data);
        AuthModel authData = AuthModel.fromJson(data);
        sl.get<PreferenceManager>().saveStringData(keyAccessToken, authData.token ?? "");
        return DataSuccess(authData);
      } else {
        return DataFailed(DioException(
            error: response.statusCode,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions),
        );
      }
    } on DioException catch (ex) {
      return DataFailed(ex);
    }
  }
}