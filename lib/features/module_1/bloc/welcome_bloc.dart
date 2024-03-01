import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_event.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_state.dart';
import 'package:un1que_new/features/module_1/services/form_input_service.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final FormInputService service;

  WelcomeBloc(this.service) : super(RegistrationFormState()) {
    on<LoadFormInputEvent>(_onLoadFormInput);
    on<RegistrationFormInputEvent>(_onRegistrationForm);
    on<SelectIndividualOptionEvent>(_onSelectIndividualOption);
    on<SelectProfessionalOptionEvent>(_onSelectProfessionalOption);
    on<AddDataEvent>(_onAddDataEvent);
    on<DeleteDataEvent>(_onDeleteDataEvent);
    on<SaveUserName>(_onSaveUserName);
  }

  _onLoadFormInput(LoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInput();
    emit(LoadedFormState(data));
  }

  _onRegistrationForm(RegistrationFormInputEvent event, Emitter emit) async {
    await service.init();
    emit(WelcomeInitialState());
  }

  _onSelectIndividualOption(
      SelectIndividualOptionEvent event, Emitter emit) async {
    await service.changeSelectedOption(TypeOption.individual).then((_) async {
      final data = service.getFormInput();
      emit(LoadedFormState(data));
    });
  }

  _onSelectProfessionalOption(
      SelectProfessionalOptionEvent event, Emitter emit) async {
    await service.changeSelectedOption(TypeOption.professional).then((_) async {
      final data = service.getFormInput();
      emit(LoadedFormState(data));
    });
  }

  _onAddDataEvent(AddDataEvent event, Emitter emit) async {
    // await service.addData(event.name);
    final data = service.getFormInput();
    emit(LoadedFormState(data));
  }

  _onDeleteDataEvent(DeleteDataEvent event, Emitter emit) async {
    await service.removeData(event.name);
    final data = service.getFormInput();
    emit(LoadedFormState(data));
  }

  _onSaveUserName(SaveUserName event, Emitter emit) async {
    await service.saveUserName(event.userName);
    final data = service.getFormInput();
    emit(LoadedFormState(data));
  }
}
