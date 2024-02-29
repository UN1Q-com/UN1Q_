import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/custom_date_input.dart';
import 'package:un1que_new/core/styled_widgets/progress_bar.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercise_state.dart';

class StartDateSelectingPage extends StatefulWidget {
  const StartDateSelectingPage({super.key});

  @override
  State<StartDateSelectingPage> createState() => _StartDateSelectingPage();
}

class _StartDateSelectingPage extends State<StartDateSelectingPage> {
  final _formKey = GlobalKey<FormState>();
  final txtDate = TextEditingController();

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
              final arg = ModalRoute.of(context)?.settings.arguments;
              if (arg != null) {
                BlocProvider.of<ExerciseBloc>(context)
                    .add(InconsistentlyLoadFormInputEvent());
              } else {
                BlocProvider.of<ExerciseBloc>(context)
                    .add(ConfidentLoadFormInputEvent());
              }

              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
        if (state is WishStartLoadedFormState) {
          final data = state.formInput;
          if (state.formInput.options.first.value != null) {
            txtDate.text = state.formInput.options.first.value;
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
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: ThemeSpacing.xlg),
                      Form(
                        key: _formKey,
                        child: CustomDateInput(
                          controller: txtDate,
                          date: DateTime.tryParse(
                              txtDate.text.isEmpty ? "" : txtDate.text),
                          dateString: '',
                          onDateChanged: (value) {
                            setState(() {
                              txtDate.text =
                                  "${value.day}/${value.month}/${value.year}";
                            });
                            BlocProvider.of<ExerciseBloc>(context)
                                .add(ChangeStartDate(txtDate.text));
                          },
                          onDateStringChanged: (value) {
                            setState(() {
                              txtDate.text = value;
                            });
                            BlocProvider.of<ExerciseBloc>(context)
                                .add(ChangeStartDate(txtDate.text));
                          },
                        ),
                      )
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
                          //if (_formKey.currentState!.validate()) {}
                          ///Todo; redirect user to the nutrition
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
