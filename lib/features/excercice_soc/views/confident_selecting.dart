import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/progress_bar.dart';
import 'package:un1que_new/core/styled_widgets/slider_bar.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercise_state.dart';
import 'package:un1que_new/features/excercice_soc/views/start_date_selecting.dart';

class ConfidentSelectingPage extends StatefulWidget {
  const ConfidentSelectingPage({super.key});

  @override
  State<ConfidentSelectingPage> createState() => _ConfidentSelectingPage();
}

class _ConfidentSelectingPage extends State<ConfidentSelectingPage> {
  double sliderVal = 1.0;

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
                  .add(RegularlyLoadFormInputEvent());
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(builder: (ctx, state) {
        if (state is ConfidentLoadedFormState) {
          sliderVal =
              double.parse(state.formInput.options.first.value.toString());
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
                        state.formInput.questionTitle,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: ThemeSpacing.xlg),
                      SliderBar(
                        divisions: 5,
                        onChanged: (e) {
                          setState(() {
                            sliderVal = e;
                          });
                          BlocProvider.of<ExerciseBloc>(context)
                              .add(SelectSliderEvent(sliderVal));
                        },
                        value: sliderVal,
                        min: 1,
                        start: 1,
                      ),
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
                          BlocProvider.of<ExerciseBloc>(context)
                              .add(WishStartFormInputEvent());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const StartDateSelectingPage()));
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
        return const SizedBox();
      }),
    );
  }
}
