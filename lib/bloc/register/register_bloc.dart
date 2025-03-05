import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/bloc/register/register_event.dart';
import 'package:registration_in_bloc/bloc/register/register_state.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      // Call the repository to add the user (does not return anything)
      await userRepository.addUser(event.user);

      // Emit success directly with the user's information from the event
      emit(RegisterSuccess(
        name: event.user.name,
        email: event.user.email,
        phone: event.user.phone,
        username: event.user.username,
        password: event.user.password,
      ));
    } 
    catch (e) {
      // Emit failure state if there's an error
      emit(RegisterFailure(error: e.toString()));
      print(e.toString());
    }
  }
}
