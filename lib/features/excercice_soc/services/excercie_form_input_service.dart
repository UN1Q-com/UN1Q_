import 'package:hive/hive.dart';
import 'package:un1que_new/features/module_1/models/form_input.dart';
import 'package:un1que_new/features/module_1/models/option_model.dart';

class ExerciseFormInputService {
  late Box<FormInput> _exerciseFormInput;

  Future<void> init() async {
    _exerciseFormInput = await Hive.openBox("formInputBoxExercise");
    _addData();
    addRegularlyData();
    addInconsistentlyData();
    addNotExercisingData();
    addDescribesData();
    addDontStartData();
    addConfidentData();
    addWishStartData();
  }

  List<FormInput> getFormInput() {
    return _exerciseFormInput.values.toList();
  }

  FormInput getFormInputByKey(String key) {
    return _exerciseFormInput.get(key)!;
  }

  void addRegularlyData() async {
    if (_exerciseFormInput.get("regularly") == null) {
      _exerciseFormInput.put(
          "regularly",
          FormInput(
            "How long have you been exercising regularly ?",
            "",
            [
              Option(0, "Less than 6 months", true),
              Option(1, "More than 6 months", false),
            ],
          ));
    }
  }

  Future<void> changeRegularlyData(int index) async {
    await _exerciseFormInput.put(
        "regularly",
        FormInput(
          "How long have you been exercising regularly ?",
          "",
          [
            Option(0, "Less than 6 months", index == 0),
            Option(1, "More than 6 months", index == 1),
          ],
        ));
  }

  void addInconsistentlyData() async {
    if (_exerciseFormInput.get("inconsistently") == null) {
      _exerciseFormInput.put(
          "inconsistently",
          FormInput(
            "Do you intend to start exercising consistently at least once a week ?",
            "",
            [
              Option(0, "No", true),
              Option(1, "Yes", false),
            ],
          ));
    }
  }

  Future<void> changeInconsistentlyData(int index) async {
    await _exerciseFormInput.put(
        "inconsistently",
        FormInput(
          "Do you intend to start exercising consistently at least once a week ?",
          "",
          [
            Option(0, "No", index == 0),
            Option(1, "Yes", index == 1),
          ],
        ));
  }

  void addNotExercisingData() async {
    if (_exerciseFormInput.get("not_exercising") == null) {
      _exerciseFormInput.put(
          "not_exercising",
          FormInput(
            "When do you intend to start exercising ?",
            "",
            [
              Option(0, "I don’t wish to start", true),
              Option(1, "In the near future", false),
              Option(2, "Within the next month", false),
            ],
          ));
    }
  }

  Future<void> changeNotExercisingData(int index) async {
    await _exerciseFormInput.put(
        "not_exercising",
        FormInput(
          "When do you intend to start exercising ?",
          "",
          [
            Option(0, "I don’t wish to start", index == 0),
            Option(1, "In the near future", index == 1),
            Option(2, "Within the next month", index == 2),
          ],
        ));
  }

  void addDescribesData() async {
    if (_exerciseFormInput.get("describes") == null) {
      _exerciseFormInput.put(
          "describes",
          FormInput(
            "Which of these best describes you ?",
            "",
            [
              Option(
                  0,
                  "I wish to become more consistent but I cannot commit to exercising consistently at least for the next 6 months.",
                  true),
              Option(
                  1,
                  "I wish to exercise consistently and plan to start sometime in the next 6 months.",
                  false),
            ],
          ));
    }
  }

  Future<void> changeDescribesData(int index) async {
    _exerciseFormInput.put(
        "describes",
        FormInput(
          "Which of these best describes you ?",
          "",
          [
            Option(
                0,
                "I wish to become more consistent but I cannot commit to exercising consistently at least for the next 6 months.",
                index == 0),
            Option(
                1,
                "I wish to exercise consistently and plan to start sometime in the next 6 months.",
                index == 1),
          ],
        ));
  }

  void addDontStartData() async {
    if (_exerciseFormInput.get("dont_start") == null) {
      _exerciseFormInput.put(
          "dont_start",
          FormInput(
            "Select whichever apply to you",
            "",
            [
              Option(
                  0,
                  "I don’t see any value in exercising and therefore have no desire to start.",
                  true),
              Option(
                  1,
                  "I appreciate the value of exercising but the difficuties of starting put me off.",
                  false),
            ],
          ));
    }
  }

  Future<void> changeDontStartData(int index) async {
    await _exerciseFormInput.put(
        "dont_start",
        FormInput(
          "Select whichever apply to you",
          "",
          [
            Option(
                0,
                "I don’t see any value in exercising and therefore have no desire to start.",
                index == 0),
            Option(
                1,
                "I appreciate the value of exercising but the difficuties of starting put me off.",
                index == 1),
          ],
        ));
  }

  void addConfidentData() async {
    if (_exerciseFormInput.get("confident") == null) {
      _exerciseFormInput.put(
          "confident",
          FormInput(
            "On a scale of 1-5, how confident are you in your ability to be consistent and persevere with your exercise ?",
            "",
            [
              Option(
                0,
                "",
                false,
                value: 1.0,
              ),
            ],
          ));
    }
  }

  void addWishStartData() async {
    if (_exerciseFormInput.get("start") == null) {
      _exerciseFormInput.put(
          "start",
          FormInput(
            "When do you wish to start your UNIQ program ?",
            "",
            [
              Option(
                0,
                "",
                false,
                value: "",
              ),
            ],
          ));
    }
  }

  Future<void> changeWishStartData(String value) async {
    await _exerciseFormInput.put(
        "start",
        FormInput(
          "When do you wish to start your UNIQ program ?",
          "",
          [
            Option(
              0,
              "",
              false,
              value: value,
            ),
          ],
        ));
  }

  Future<void> changeConfidentData(double value) async {
    await _exerciseFormInput.put(
        "confident",
        FormInput(
          "On a scale of 1-5, how confident are you in your ability to be consistent and persevere with your exercise ?",
          "",
          [
            Option(
              0,
              "",
              false,
              value: value,
            ),
          ],
        ));
  }

  void _addData() async {
    if (_exerciseFormInput.get("exercise") == null) {
      _exerciseFormInput.put(
          "exercise",
          FormInput(
            "How frequently do you exercise ?",
            "First let’s figure out where you’re starting from in terms of your current attitudes towards exercise and nutrition. Select one of the following statements that best applies to you in terms of exercise?",
            [
              Option(
                  0,
                  "Regularly",
                  subTitle: "I’m currently exercising regularly.",
                  true),
              Option(
                  1,
                  "Inconsistently",
                  subTitle: "I’m currently exercising but inconsistently.",
                  false),
              Option(
                  2,
                  "Not exercising",
                  subTitle: "I’m currently not exercising.",
                  false),
            ],
          ));
    }
  }

  Future<void> changeSelectedOption(int index) async {
    await _exerciseFormInput.put(
        "exercise",
        FormInput(
          "How frequently do you exercise ?",
          "First let’s figure out where you’re starting from in terms of your current attitudes towards exercise and nutrition. Select one of the following statements that best applies to you in terms of exercise?",
          [
            Option(
                0,
                "Regularly",
                subTitle: "I’m currently exercising regularly.",
                index == 0),
            Option(
                1,
                "Inconsistently",
                subTitle: "I’m currently exercising but inconsistently.",
                index == 1),
            Option(
                2,
                "Not exercising",
                subTitle: "I’m currently not exercising.",
                index == 2),
          ],
        ));
  }
}
