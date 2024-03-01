import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/buttons/filled_buttons/info_filled_button.dart';
import 'package:un1que_new/core/styled_widgets/buttons/filled_buttons/primary_filled_button.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/styled_widgets/text/heading/heading2/heading2_bold.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/views/select_exercicing.dart';

class SocExerciseInfoPage extends StatelessWidget {
  const SocExerciseInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        surfaceTintColor: ThemeColors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: ScreenPadding.horizontal,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: ThemeSpacing.xlg),
                  TextHeading2Bold.primary(
                    "Exercise STAGE of Change",
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 16),
                  TextBody1Regular.primary(
                    "First let's figure out where you're starting from in terms of your current attitudes towards exercise and nutrition.",
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledInfoButton.text(
                        label: '${"Learn more"}..',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: ThemeSpacing.xlg),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    color: ThemeColors.white,
                    padding: EdgeInsets.only(
                      top: ThemeSpacing.sm,
                      bottom: Platform.isAndroid ? ThemeSpacing.sm : 0,
                    ),
                    child: FilledPrimaryButton.text(
                      label: context.translate("continue_title"),
                      onPress: () {
                        BlocProvider.of<ExerciseBloc>(context)
                            .add(ExerciseLoadFormInputEvent());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ExerciceSelectingPage()));
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
