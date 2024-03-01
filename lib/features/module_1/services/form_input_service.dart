import 'package:hive/hive.dart';
import 'package:un1que_new/features/module_1/models/form_input.dart';
import 'package:un1que_new/features/module_1/models/option_model.dart';

enum TypeOption {
  individual,
  professional,
}

class FormInputService {
  late Box<FormInput> _formInput;

  Future<void> init() async {
    Hive.registerAdapter(OptionAdapter());
    Hive.registerAdapter(FormInputAdapter());
    _formInput = await Hive.openBox("formInputBox");
    await addData();
  }

  List<FormInput> getFormInput() {
    return _formInput.values.toList();
  }

  Future<void> changeSelectedOption(TypeOption type) async {
    await _formInput.put(
        "exercise",
        FormInput("Are you an exercise professional or individual ?", "", [
          Option(
              0,
              "I am an exercise professional wishing to use UN1Q to support my clients.",
              type == TypeOption.professional),
          Option(
              1,
              "I am an individual wishing to use the app for my training.",
              type == TypeOption.individual)
        ]));
  }

  Future<void> _addExerciceData() async {
    await _formInput.put(
        "register",
        FormInput("Are you an exercise professional or individual ?", "", [
          Option(
              0,
              "I am an exercise professional wishing to use UN1Q to support my clients.",
              true),
          Option(
              1,
              "I am an individual wishing to use the app for my training.",
              false)
        ]));
  }

  Future<void> _addUserNameData() async {
    await _formInput.put(
        "userName",
        FormInput("What should we call you ?", "", [
          Option(0, "UserName", false),
        ]));
  }

  Future<void> removeData(String routeName) async {
    if (routeName == "register") {
      await _formInput.delete("register");
    }
    if (routeName == "userName") {
      await _formInput.delete("userName");
    }
  }

  Future<void> saveUserName(String value) async {
    await _formInput.put(
        "UserName",
        FormInput(
          "What should we call you ?",
          "",
          [
            Option(0, "UserName", false),
          ],
          username: value,
        ));
  }

  List<dynamic> getKeys() {
    final keys = _formInput.keys;
    return keys.toList();
  }

  Future<void> addData() async {
    // switch (routeName) {
    //   case "register":
    //     {
    //       if (_formInput.get("register") == null) {
    //         _addExerciceData();
    //       }
    //     }
    //   case "userName":
    //     {
    //       if (_formInput.get("UserName") == null) {
    //         _addUserNameData();
    //       }
    //     }
    // }
    if (_formInput.get("register") == null &&
        _formInput.get("UserName") == null) {
      await _addExerciceData().then((value) async => await _addUserNameData());
    }
  }
}
