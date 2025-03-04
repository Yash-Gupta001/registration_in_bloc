import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/bloc/login/login_event.dart';
import 'package:registration_in_bloc/bloc/login/login_state.dart';
import '../../repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final user = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        if (user != null) {
          yield LoginSuccess(user: user);
        } else {
          yield LoginFailure(error: 'Invalid username or password');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
  
}
