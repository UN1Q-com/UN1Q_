import 'package:hive/hive.dart';

part "option_model.g.dart";

///radio buttons,input,dropdown......
@HiveType(typeId: 2)
class Option extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String? subTitle;
  @HiveField(4)
  final bool selected;
  @HiveField(5)
  final dynamic value;

  Option(this.id, this.text, this.selected, {this.subTitle, this.value});
}
