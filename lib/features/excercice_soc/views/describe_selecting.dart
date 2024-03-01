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

class DescribesSelectingPage extends StatefulWidget {
  const DescribesSelectingPage({super.key});

  @override
  State<DescribesSelectingPage> createState() => _InconsistentlySelectingPage();
}

class _InconsistentlySelectingPage extends State<DescribesSelectingPage> {
  final groupsValue = <String>["No", "Yes"];
  String currentValue = "No";

  @override
  Widget build(BuildContext context) {
    final navigatorArg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate("exercise_title"),
          style: const TextStyle(fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {
              if (navigatorArg != null) {
                BlocProvider.of<ExerciseBloc>(context)
                    .add(NotExercisingLoadFormInputEvent());
              } else {
                BlocProvider.of<ExerciseBloc>(context)
                    .add(InconsistentlyLoadFormInputEvent());
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
        if (state is DescribesLoadedFormState) {
          final data = state.formInput;
          currentValue =
              (data.options.first.selected) ? groupsValue[0] : groupsValue[1];
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
                            fontSize: 26),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: ThemeSpacing.xlg),
                      RadioButton(
                        enabled: true,
                        title: data.options.first.text,
                        //data.options[0].text,
                        value: groupsValue[0],
                        groupValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            currentValue = value!;
                          });
                          context
                              .read<ExerciseBloc>()
                              .add(SelectFirstDescribe());
                        },
                      ),
                      const SizedBox(height: ThemeSpacing.xlg),
                      RadioButton(
                        enabled: true,
                        title: data.options.last.text,
                        value: groupsValue[1],
                        groupValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            currentValue = value!;
                          });
                          context
                              .read<ExerciseBloc>()
                              .add(SelectLastDescribe());
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColors.secondary,
                          fixedSize: const Size(500, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
    );
  }
}
