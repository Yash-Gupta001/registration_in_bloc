abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String email;
  final String phone;
  final String username; 
  final String password;
  
  RegisterButtonPressed(
    this.name,
    this.email,
    this.phone,
    this.username, 
    this.password
    );
}

