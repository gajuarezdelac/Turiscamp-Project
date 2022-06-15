import 'package:logger/logger.dart';
import 'package:turiscamp/src/models/params/user_register_params.dart';

class AuthService {
  final Logger logger = Logger();

  // ** : Servicio para loguearnos
  Future<String> login(String user, String password) async {
    return "";
  }

  // ** : Servicio para registrarnos
  Future<String> register(UserRegisterParams params) async {
    return "";
  }
}
