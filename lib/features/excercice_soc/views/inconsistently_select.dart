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
import 'package:un1que_new/features/excercice_soc/views/start_date_selecting.dart';

class InconsistentlySelectingPage extends StatefulWidget {
  const InconsistentlySelectingPage({super.key});

  @override
  State<InconsistentlySelectingPage> createState() =>
      _InconsistentlySelectingPage();
}

class _InconsistentlySelectingPage extends State<InconsistentlySelectingPage> {
  final groupsValue = <String>["No", "Yes"];
  String currentValue = "No";

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
      body: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
        if (state is InconsistentlyLoadedFormState) {
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
                              .add(SelectNoOptionEvent());
                        },
                      ),
                      const SizedBox(height: ThemeSpacing.md),
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
                              .add(SelectYesOptionEvent());
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              if (currentValue == groupsValue[0]) {
                                BlocProvider.of<ExerciseBloc>(context)
                                    .add(WishStartFormInputEvent());
                                return const StartDateSelectingPage();
                              } else {
                                BlocProvider.of<ExerciseBloc>(context)
                                    .add(DescribesLoadFormInputEvent());
                                return const DescribesSelectingPage();
                              }
                            },
                            settings: currentValue == groupsValue[0]
                                ? const RouteSettings(arguments: "val")
                                : null,
                          ));
                        },
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
