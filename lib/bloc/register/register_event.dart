import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';

abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final UserEntity user;

  RegisterButtonPressed({
    required this.user,
  });
}
