import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/buttons/radio_buttons/radio_button.dart';
import 'package:un1que_new/core/styled_widgets/progress_bar.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercise_state.dart';
import 'package:un1que_new/features/excercice_soc/views/inconsistently_select.dart';
import 'package:un1que_new/features/excercice_soc/views/not_exercising.dart';
import 'package:un1que_new/features/excercice_soc/views/regularly_select.dart';

class ExerciceSelectingPage extends StatefulWidget {
  const ExerciceSelectingPage({super.key});

  static const routeName = '/register-type';

  @override
  State<ExerciceSelectingPage> createState() => _RegisterTypePageState();
}

class _RegisterTypePageState extends State<ExerciceSelectingPage> {
  final groupsValue = <String>["regulary", "inconsistesy", "not"];
  String currentValue = "regulary";

  @override
  void dispose() {
    super.dispose();
  }

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
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
        if (state is ExerciseLoadedFormState) {
          final data = state.data
              .where((element) => element.options.length > 2)
              .toList()
              .first;
          if (data.options[0].selected) currentValue = groupsValue[0];
          if (data.options[1].selected) currentValue = groupsValue[1];
          if (data.options[2].selected) currentValue = groupsValue[2];
          return SafeArea(
            child: Stack(
              children: [
                const ProgressBar(index: 1, total: 10),
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
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: ThemeSpacing.xs),
                      TextBody1Regular.primary(
                        data.subTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: ThemeSpacing.xs),
                      RadioButton(
                        enabled: true,
                        title: data.options[0].text,
                        subtitle: data.options[0].subTitle ?? "",
                        value: groupsValue[0],
                        groupValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            currentValue = value!;
                          });
                          context
                              .read<ExerciseBloc>()
                              .add(SelectRegularlyOptionEvent());
                        },
                      ),
                      const SizedBox(height: ThemeSpacing.md),
                      RadioButton(
                        enabled: true,
                        title: data.options[1].text,
                        subtitle: data.options[1].subTitle ?? "",
                        value: groupsValue[1],
                        groupValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            currentValue = value!;
                          });
                          context
                              .read<ExerciseBloc>()
                              .add(SelectInconsistentlyOptionEvent());
                        },
                      ),
                      const SizedBox(height: ThemeSpacing.md),
                      RadioButton(
                        enabled: true,
                        title: data.options[2].text,
                        subtitle: data.options[2].subTitle ?? "",
                        value: groupsValue[2],
                        groupValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            currentValue = value!;
                          });
                          context
                              .read<ExerciseBloc>()
                              .add(SelectNotExercisingOptionEvent());
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
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            if (currentValue.startsWith("r")) {
                              BlocProvider.of<ExerciseBloc>(context)
                                  .add(RegularlyLoadFormInputEvent());
                              return const RegularlySelectingPage();
                            }
                            if (currentValue.startsWith("i")) {
                              BlocProvider.of<ExerciseBloc>(context)
                                  .add(InconsistentlyLoadFormInputEvent());
                              return const InconsistentlySelectingPage();
                            }
                            if (currentValue.startsWith("n")) {
                              BlocProvider.of<ExerciseBloc>(context)
                                  .add(NotExercisingLoadFormInputEvent());
                              return const NotExercisingSelectingPage();
                            }
                            return const RegularlySelectingPage();
                          }));
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
