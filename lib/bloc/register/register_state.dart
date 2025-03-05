abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}

class RegisterSuccess extends RegisterState {
  final String name;
  final String email;
  final String phone;
  final String username;
  final String password;

  RegisterSuccess({
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });
}
