import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/bloc/register/register_event.dart';
import 'package:registration_in_bloc/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    
  }
}
