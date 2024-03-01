abstract class WelcomeEvent {}

class ContinueEvent extends WelcomeEvent {
  final String routeName;

  ContinueEvent(this.routeName);
}

class LoadFormInputEvent extends WelcomeEvent {
  //final String routeName;

  LoadFormInputEvent();
}

class RegistrationFormInputEvent extends WelcomeEvent {}

class SelectProfessionalOptionEvent extends WelcomeEvent {}

class SelectIndividualOptionEvent extends WelcomeEvent {}

class AddDataEvent extends WelcomeEvent {
  final String name;

  AddDataEvent(this.name);
}

class DeleteDataEvent extends WelcomeEvent {
  final String name;

  DeleteDataEvent(this.name);
}

class SaveUserName extends WelcomeEvent {
  final String userName;

  SaveUserName(this.userName);
}
