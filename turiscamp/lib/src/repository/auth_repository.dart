import 'package:turiscamp/src/models/params/user_register_params.dart';
import 'package:turiscamp/src/services/auth_service.dart';

class AuthRepository {
  AuthService service = AuthService();

  Future<String> login({required String user, required String password}) =>
      service.login(user, password);

  Future<String> register({required UserRegisterParams params}) =>
      service.register(params);
}
