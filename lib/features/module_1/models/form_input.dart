import 'package:hive/hive.dart';
import 'package:un1que_new/features/module_1/models/option_model.dart';

part "form_input.g.dart";

@HiveType(typeId: 1)
class FormInput extends HiveObject {
  @HiveField(0)
  final String questionTitle;
  @HiveField(1)
  final String subTitle;
  @HiveField(3)
  final List<Option> options;
  @HiveField(4)
  final String? currentScreenName;
  @HiveField(5)
  final String? username;

  FormInput(this.questionTitle, this.subTitle, this.options,
      {this.currentScreenName, this.username});
}
