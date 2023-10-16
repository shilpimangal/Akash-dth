import '../core/resources/data_state.dart';
import '../data/model/auth/auth_dto.dart';
import '../data/model/auth/auth_model.dart';

abstract class AuthRepository {
  Future<DataState<AuthModel>> appAuthentication(AuthDto authDto);
}