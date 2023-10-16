import 'package:dio/dio.dart';

import '../../../core/helper/api_end_points.dart';
import '../../../core/resources/http_client.dart';
import '../../model/auth/auth_dto.dart';

class AuthService {
  final ApiHttpClient _httpClient;

  AuthService(this._httpClient);

  Future<Response> appAuthentication(AuthDto authDto) {
    final formData = FormData.fromMap({
      'sud_id': authDto.subId,
      'pin': authDto.pin,
    });
    return _httpClient.sendRequest.post(
      loginEndUrl,
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }
}
