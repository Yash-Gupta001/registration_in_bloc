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
    // Validate fields
    if (event.user.name.isEmpty ||
        event.user.email.isEmpty ||
        event.user.phone.isEmpty ||
        event.user.username.isEmpty ||
        event.user.password.isEmpty) {
      emit(RegisterFailure(error: 'Please fill all fields'));
      return;
    }

    // Validate email format
    final emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(event.user.email)) {
      emit(RegisterFailure(error: 'Please enter a valid email address'));
      return;
    }

    // Validate phone number (exactly 10 digits)
    final phoneRegex = r'^\d{10}$';
    if (!RegExp(phoneRegex).hasMatch(event.user.phone)) {
      emit(RegisterFailure(error: 'Please enter a valid 10-digit phone number'));
      return;
    }

    // Validate password length
    if (event.user.password.length < 6) {
      emit(RegisterFailure(error: 'Password must be at least 6 characters'));
      return;
    }

    emit(RegisterLoading());
    try {
      // Call the repository to add the user
      await userRepository.addUser(event.user);

      // Emit success state
      emit(RegisterSuccess(
        name: event.user.name,
        email: event.user.email,
        phone: event.user.phone,
        username: event.user.username,
        password: event.user.password,
      ));
    } catch (e) {
      emit(RegisterFailure(error: 'Registration failed: ${e.toString()}'));
    }
  }
}