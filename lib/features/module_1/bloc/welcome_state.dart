import 'package:un1que_new/features/module_1/models/form_input.dart';

abstract class WelcomeState {}

class WelcomeInitialState extends WelcomeState {}

class LoadedFormState extends WelcomeState {
  final List<FormInput> data;

  LoadedFormState(this.data);
}

class RegistrationFormState extends WelcomeState {}

class UserNameSaved extends WelcomeState {}
