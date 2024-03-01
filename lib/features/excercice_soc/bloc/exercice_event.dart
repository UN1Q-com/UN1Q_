abstract class ExerciseEvent {}

class ContinueEvent extends ExerciseEvent {
  final String routeName;

  ContinueEvent(this.routeName);
}

class ExerciseLoadFormInputEvent extends ExerciseEvent {
  // final String routeName;

  ExerciseLoadFormInputEvent();
}

class RegularlyLoadFormInputEvent extends ExerciseEvent {
  RegularlyLoadFormInputEvent();
}

class InconsistentlyLoadFormInputEvent extends ExerciseEvent {
  InconsistentlyLoadFormInputEvent();
}

class NotExercisingLoadFormInputEvent extends ExerciseEvent {
  NotExercisingLoadFormInputEvent();
}

class ConfidentLoadFormInputEvent extends ExerciseEvent {
  ConfidentLoadFormInputEvent();
}

class WishStartFormInputEvent extends ExerciseEvent {
  WishStartFormInputEvent();
}

class DescribesLoadFormInputEvent extends ExerciseEvent {}

class DontStartLoadFormInputEvent extends ExerciseEvent {}

class ExerciseRegistrationFormInputEvent extends ExerciseEvent {}

class ExerciseSelectProfessionalOptionEvent extends ExerciseEvent {}

class ExerciseSelectIndividualOptionEvent extends ExerciseEvent {}

class AddDataEvent extends ExerciseEvent {
  final String name;

  AddDataEvent(this.name);
}

class SelectSliderEvent extends ExerciseEvent {
  final double value;

  SelectSliderEvent(this.value);
}

class SelectRegularlyOptionEvent extends ExerciseEvent {}

class SelectInconsistentlyOptionEvent extends ExerciseEvent {}

class SelectNotExercisingOptionEvent extends ExerciseEvent {}

class SelectLessOptionEvent extends ExerciseEvent {}

class SelectMoreOptionEvent extends ExerciseEvent {}

class SelectYesOptionEvent extends ExerciseEvent {}

class SelectNoOptionEvent extends ExerciseEvent {}

class SelectFirstOption extends ExerciseEvent {}

class SelectSecondOption extends ExerciseEvent {}

class SelectLastOption extends ExerciseEvent {}

class SelectFirstDescribe extends ExerciseEvent {}

class SelectLastDescribe extends ExerciseEvent {}

class SelectFirstApply extends ExerciseEvent {}

class SelectLastApply extends ExerciseEvent {}

class ChangeStartDate extends ExerciseEvent {
  final String value;

  ChangeStartDate(this.value);
}
