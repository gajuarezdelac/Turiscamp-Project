import 'package:bloc/bloc.dart';
import 'package:turiscamp/src/bloc/auth/login/login_event.dart';
import 'package:turiscamp/src/bloc/auth/login/login_state.dart';
import 'package:turiscamp/src/repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState());

  final _repositoryAuth = AuthRepository();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield IsLoadingAuth();

    if (event is EventAuth) {
      yield IsLoadingAuth();
      try {
        String response = await _repositoryAuth.login(
            user: event.user, password: event.password);

        yield SuccessAuth(response: response);
      } catch (e) {
        yield ErrorAuth(errorMessage: e.toString());
      }
    }
  }
}
