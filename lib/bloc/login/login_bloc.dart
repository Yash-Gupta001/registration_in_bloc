import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/bloc/login/login_event.dart';
import 'package:registration_in_bloc/bloc/login/login_state.dart';
import '../../repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    // Register the event handler for LoginButtonPressed
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading()); 
    try {
      final user = await userRepository.authenticate(
        username: event.username,
        password: event.password,
      );
      if (user != null) {
        emit(LoginSuccess(user: user)); 
      } 
      else {
        emit(LoginFailure(error: 'Invalid username or password')); 
      }
    } 
    catch (e) {
      emit(LoginFailure(error: e.toString())); 
    }
  }
}