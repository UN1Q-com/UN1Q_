import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/buttons/radio_buttons/radio_button.dart';
import 'package:un1que_new/core/styled_widgets/progress_bar.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercise_state.dart';
import 'package:un1que_new/features/excercice_soc/views/describe_selecting.dart';
import 'package:un1que_new/features/excercice_soc/views/dont_start_selecting.dart';

class NotExercisingSelectingPage extends StatefulWidget {
  const NotExercisingSelectingPage({super.key});

  @override
  State<NotExercisingSelectingPage> createState() =>
      _NotExercisingSelectingPage();
}

class _NotExercisingSelectingPage extends State<NotExercisingSelectingPage> {
  final groupsValue = <String>["regulary", "inconsistesy", "not"];
  String currentValue = "regulary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate("exercise_title"),
          style: const TextStyle(fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<ExerciseBloc>(context)
                  .add(ExerciseLoadFormInputEvent());
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
          if (state is NotExercisingLoadedFormState) {
            final data = state.formInput;
            if (state.formInput.options[0].selected) {
              currentValue = groupsValue[0];
            }
            if (state.formInput.options[1].selected) {
              currentValue = groupsValue[1];
            }
            if (state.formInput.options[2].selected) {
              currentValue = groupsValue[2];
            }
            return SafeArea(
              child: Stack(
                children: [
                  const ProgressBar(index: 4, total: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: ThemeSpacing.xlg),
                        Text(
                          data.questionTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 27),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: ThemeSpacing.xlg),
                        RadioButton(
                          enabled: true,
                          title: data.options[0].text,
                          //data.options[0].text,
                          value: groupsValue[0],
                          groupValue: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value!;
                            });
                            context
                                .read<ExerciseBloc>()
                                .add(SelectFirstOption());
                          },
                        ),
                        const SizedBox(height: ThemeSpacing.md),
                        RadioButton(
                          enabled: true,
                          title: data.options[1].text,
                          value: groupsValue[1],
                          groupValue: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value!;
                            });
                            context
                                .read<ExerciseBloc>()
                                .add(SelectSecondOption());
                          },
                        ),
                        const SizedBox(height: ThemeSpacing.md),
                        RadioButton(
                          enabled: true,
                          title: data.options.last.text,
                          value: groupsValue[2],
                          groupValue: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value!;
                            });
                            context
                                .read<ExerciseBloc>()
                                .add(SelectLastOption());
                          },
                        ),
                        const SizedBox(height: ThemeSpacing.xlg),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: ThemeColors.white,
                      padding: EdgeInsets.only(
                        top: ThemeSpacing.sm,
                        left: ScreenPadding.horizontal.left,
                        right: ScreenPadding.horizontal.right,
                        bottom: Platform.isAndroid ? ThemeSpacing.sm : 0,
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            if (currentValue == groupsValue[0]) {
                              BlocProvider.of<ExerciseBloc>(context)
                                  .add(DontStartLoadFormInputEvent());
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      const DontStartSelectingPage()));
                            }
                            if (currentValue == groupsValue[1]) {
                              BlocProvider.of<ExerciseBloc>(context)
                                  .add(DescribesLoadFormInputEvent());
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      const DescribesSelectingPage(),
                                  settings:
                                      const RouteSettings(arguments: "val")));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.secondary,
                            fixedSize: const Size(500, 50),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text(
                            context.translate("continue_title"),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
