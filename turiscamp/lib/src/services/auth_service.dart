import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:turiscamp/src/models/params/user_register_params.dart';
import 'package:turiscamp/src/models/response/http_response.dart';
import 'package:turiscamp/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final Logger logger = Logger();
  String host = Constants.apiUrl;

  // ** : Servicio para loguearnos
  Future<String> login(String user, String password) async {
    return "";
  }

  // ** : Servicio para registrarnos
  Future<String> register(UserRegisterParams params) async {
    return "";
  }

  // ** Servicio para recuperar la contraseña
  Future<HttpResponse> recoveryPassword(String email) async {
    var uri = Uri.http(
      host,
      '/user/recovery/$email',
    );

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      return HttpResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }
}
