import 'package:un1que_new/features/module_1/models/form_input.dart';

abstract class ExerciseState {}

class ExerciseInitialState extends ExerciseState {}

class ExerciseLoadedFormState extends ExerciseState {
  final List<FormInput> data;

  ExerciseLoadedFormState(this.data);
}

class RegistrationFormState extends ExerciseState {}

class RegularlyLoadedFormState extends ExerciseState {
  final FormInput formInput;

  RegularlyLoadedFormState(this.formInput);
}

class InconsistentlyLoadedFormState extends ExerciseState {
  final FormInput formInput;

  InconsistentlyLoadedFormState(this.formInput);
}

class NotExercisingLoadedFormState extends ExerciseState {
  final FormInput formInput;

  NotExercisingLoadedFormState(this.formInput);
}

class DescribesLoadedFormState extends ExerciseState {
  final FormInput formInput;

  DescribesLoadedFormState(this.formInput);
}

class DontStartLoadedFormState extends ExerciseState {
  final FormInput formInput;

  DontStartLoadedFormState(this.formInput);
}

class ConfidentLoadedFormState extends ExerciseState {
  final FormInput formInput;

  ConfidentLoadedFormState(this.formInput);
}

class WishStartLoadedFormState extends ExerciseState {
  final FormInput formInput;

  WishStartLoadedFormState(this.formInput);
}
