import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turiscamp/src/bloc/bloc.dart';

List<BlocProvider> blocsServices(String token) {
  return [
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
    ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
    ),
  ];
}
