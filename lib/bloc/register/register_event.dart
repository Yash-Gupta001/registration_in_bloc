import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';

abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final UserEntity user;

  RegisterButtonPressed({
    required this.user,
  });
}


/**
 * 
 The named parameter 'name' is required, but there's no corresponding argument.
Try adding the required argument.dartmissing_required_argument
The named parameter 'email' is required, but there's no corresponding argument.
Try adding the required argument.dartmissing_required_argument
The named parameter 'phone' is required, but there's no corresponding argument.
Try adding the required argument.dartmissing_required_argument
The named parameter 'username' is required, but there's no corresponding argument.
Try adding the required argument.dartmissing_required_argument
The named parameter 'password' is required, but there's no corresponding argument.
Try adding the required argument.dartmissing_required_argument
(new) RegisterSuccess RegisterSuccess({
  required String name,
  required String email,
  required String phone,
  required String username,
  required String password,
})
package:registration_in_bloc/bloc/register/register_state.dart */