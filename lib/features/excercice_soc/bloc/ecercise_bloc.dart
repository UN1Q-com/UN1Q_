import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercise_state.dart';
import 'package:un1que_new/features/excercice_soc/services/excercie_form_input_service.dart';
import 'package:un1que_new/features/module_1/models/form_input.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseFormInputService service;
  final List<FormInput> exerciseData = List.of([]);

  ExerciseBloc(this.service) : super(RegistrationFormState()) {
    on<ExerciseLoadFormInputEvent>(_onLoadFormInput);
    on<ExerciseRegistrationFormInputEvent>(_onRegistrationForm);
    on<AddDataEvent>(_onAddDataEvent);
    on<SelectRegularlyOptionEvent>(_onSelectRegularlyOption);
    on<SelectInconsistentlyOptionEvent>(_onSelectInconsistentlyOption);
    on<SelectNotExercisingOptionEvent>(_onSelectNotOption);
    on<RegularlyLoadFormInputEvent>(_onRegularlyLoad);
    on<InconsistentlyLoadFormInputEvent>(_onInconsistentlyLoad);
    on<NotExercisingLoadFormInputEvent>(_onNotExercisingLoad);
    on<SelectLessOptionEvent>(_onSelectLessOption);
    on<SelectMoreOptionEvent>(_onSelectMoreOption);
    on<SelectNoOptionEvent>(_onSelectNoOption);
    on<SelectYesOptionEvent>(_onSelectYesOption);
    on<SelectFirstOption>(_onSelectFirstOption);
    on<SelectSecondOption>(_onSelectSecondOption);
    on<SelectLastOption>(_onSelectLastOption);
    on<DescribesLoadFormInputEvent>(_onDescribesLoadFormData);
    on<SelectFirstDescribe>(_onSelectFirstDescribeOption);
    on<SelectLastDescribe>(_onSelectLastDescribeOption);
    on<DontStartLoadFormInputEvent>(_onDontStartLoadFormData);
    on<SelectFirstApply>(_onSelectFirstWish);
    on<SelectLastApply>(_onSelectLastWish);
    on<ConfidentLoadFormInputEvent>(_onLoadConfidentInputEvent);
    on<SelectSliderEvent>(_onSelectSliderEvent);
    on<WishStartFormInputEvent>(_onWishStartFromInput);
    on<ChangeStartDate>(_onChangeStartDate);
  }

  _onLoadFormInput(ExerciseLoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInput();
    emit(ExerciseLoadedFormState(data));
  }

  _onRegistrationForm(
      ExerciseRegistrationFormInputEvent event, Emitter emit) async {
    await service.init();
    emit(ExerciseInitialState());
  }

  _onSelectRegularlyOption(
      SelectRegularlyOptionEvent event, Emitter emit) async {
    await service.changeSelectedOption(0).then((_) async {
      final data = service.getFormInput();
      emit(ExerciseLoadedFormState(data));
    });
  }

  _onSelectInconsistentlyOption(
      SelectInconsistentlyOptionEvent event, Emitter emit) async {
    await service.changeSelectedOption(1).then((_) async {
      final data = service.getFormInput();
      emit(ExerciseLoadedFormState(data));
    });
  }

  _onSelectNotOption(SelectNotExercisingOptionEvent event, Emitter emit) async {
    await service.changeSelectedOption(2).then((_) async {
      final data = service.getFormInput();
      emit(ExerciseLoadedFormState(data));
    });
  }

  _onRegularlyLoad(RegularlyLoadFormInputEvent event, Emitter emit) {
    final regularlyData = service.getFormInputByKey("regularly");
    emit(RegularlyLoadedFormState(regularlyData));
  }

  _onInconsistentlyLoad(InconsistentlyLoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInputByKey("inconsistently");
    emit(InconsistentlyLoadedFormState(data));
  }

  _onNotExercisingLoad(NotExercisingLoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInputByKey("not_exercising");
    emit(NotExercisingLoadedFormState(data));
  }

  _onSelectLessOption(SelectLessOptionEvent event, Emitter emit) async {
    await service.changeRegularlyData(0).whenComplete(() {
      final regularlyData = service.getFormInputByKey("regularly");
      emit(RegularlyLoadedFormState(regularlyData));
    });
  }

  _onSelectMoreOption(SelectMoreOptionEvent event, Emitter emit) async {
    await service.changeRegularlyData(1).whenComplete(() {
      final regularlyData = service.getFormInputByKey("regularly");
      emit(RegularlyLoadedFormState(regularlyData));
    });
  }

  _onSelectYesOption(SelectYesOptionEvent event, Emitter emit) async {
    await service.changeInconsistentlyData(1).whenComplete(() {
      final regularlyData = service.getFormInputByKey("inconsistently");
      emit(InconsistentlyLoadedFormState(regularlyData));
    });
  }

  _onSelectNoOption(SelectNoOptionEvent event, Emitter emit) async {
    await service.changeInconsistentlyData(0).whenComplete(() {
      final regularlyData = service.getFormInputByKey("inconsistently");
      emit(InconsistentlyLoadedFormState(regularlyData));
    });
  }

  _onSelectFirstOption(SelectFirstOption event, Emitter emit) async {
    await service.changeNotExercisingData(0).whenComplete(() {
      final regularlyData = service.getFormInputByKey("not_exercising");
      emit(NotExercisingLoadedFormState(regularlyData));
    });
  }

  _onSelectSecondOption(SelectSecondOption event, Emitter emit) async {
    await service.changeNotExercisingData(1).whenComplete(() {
      final regularlyData = service.getFormInputByKey("not_exercising");
      emit(NotExercisingLoadedFormState(regularlyData));
    });
  }

  _onSelectLastOption(SelectLastOption event, Emitter emit) async {
    await service.changeNotExercisingData(2).whenComplete(() {
      final regularlyData = service.getFormInputByKey("not_exercising");
      emit(NotExercisingLoadedFormState(regularlyData));
    });
  }

  _onDescribesLoadFormData(DescribesLoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInputByKey("describes");
    emit(DescribesLoadedFormState(data));
  }

  _onSelectFirstDescribeOption(SelectFirstDescribe event, Emitter emit) async {
    await service.changeDescribesData(0).whenComplete(() {
      final data = service.getFormInputByKey("describes");
      emit(DescribesLoadedFormState(data));
    });
  }

  _onSelectLastDescribeOption(SelectLastDescribe event, Emitter emit) async {
    await service.changeDescribesData(1).whenComplete(() {
      final data = service.getFormInputByKey("describes");
      emit(DescribesLoadedFormState(data));
    });
  }

  _onDontStartLoadFormData(
      DontStartLoadFormInputEvent event, Emitter emit) async {
    final data = service.getFormInputByKey("dont_start");
    emit(DontStartLoadedFormState(data));
  }

  _onSelectFirstWish(SelectFirstApply event, Emitter emit) async {
    await service.changeDontStartData(0).whenComplete(() {
      final data = service.getFormInputByKey("dont_start");
      emit(DontStartLoadedFormState(data));
    });
  }

  _onSelectLastWish(SelectLastApply event, Emitter emit) async {
    await service.changeDontStartData(1).whenComplete(() {
      final data = service.getFormInputByKey("dont_start");
      emit(DontStartLoadedFormState(data));
    });
  }

  _onLoadConfidentInputEvent(ConfidentLoadFormInputEvent event, Emitter emit) {
    final data = service.getFormInputByKey("confident");
    emit(ConfidentLoadedFormState(data));
  }

  _onSelectSliderEvent(SelectSliderEvent event, Emitter emit) async {
    await service.changeConfidentData(event.value).whenComplete(() {
      final data = service.getFormInputByKey("confident");
      emit(ConfidentLoadedFormState(data));
    });
  }

  _onWishStartFromInput(WishStartFormInputEvent event, Emitter emit) {
    final data = service.getFormInputByKey("start");
    emit(WishStartLoadedFormState(data));
  }

  _onChangeStartDate(ChangeStartDate event, Emitter emit) async {
    await service.changeWishStartData(event.value).whenComplete(() {
      final data = service.getFormInputByKey("start");
      emit(WishStartLoadedFormState(data));
    });
  }

  _onAddDataEvent(AddDataEvent event, Emitter emit) async {}
}
