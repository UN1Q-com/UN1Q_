// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/buttons/filled_buttons/primary_filled_button.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/text_input_field/primary/primary_text_input_field.dart';
import 'package:un1que_new/core/styled_widgets/progress_bar.dart';
import 'package:un1que_new/core/styled_widgets/remove_focus.dart';
import 'package:un1que_new/core/styled_widgets/text/heading/heading4/heading4_bold.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/excercice_soc/views/info.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_bloc.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_event.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_state.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  static const routeName = '/registration-username';

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final _formKey = GlobalKey<FormState>();
  final txtUserName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.translate("user_screen_title"),
            style: const TextStyle(fontSize: 16),
          ),
          leading: IconButton(
              onPressed: () {
                // BlocProvider.of<WelcomeBloc>(context)
                //     .add(DeleteDataEvent("userName"));
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              )),
          // actions: [
          //   Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          //     decoration: BoxDecoration(us.circular(5),
          //       color: ThemeColors.darkG
          //           //       borderRadius: BorderRadirey_100,
          //     ),
          //     child: TextLabel2Regular.primary(
          //       "3 of 4", //context.l10n.appBarCount('3', '4'),
          //     ),
          //   ),
          //   const SizedBox(width: 17),
          // ],
        ),
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (ctx, state) {
          if (state is LoadedFormState) {
            final data = state.data.last;
            if (state.data.first.username != null) {
              txtUserName.text = state.data.first.username!;
            }
            return SafeArea(
              child: RemoveFocus(
                child: Stack(
                  children: [
                    const ProgressBar(index: 4, total: 10),
                    Padding(
                      padding: ScreenPadding.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: ThemeSpacing.xlg),
                          TextHeading4Bold.primary(
                            data.questionTitle, //context.l10n.whatShouldWeCallYou,
                          ),
                          const SizedBox(height: ThemeSpacing.lg),
                          Form(
                            key: _formKey,
                            child: PrimaryTextInputField(
                              hintText: context.translate("input_hint_text"),
                              label: data.options.first.text,
                              controller: txtUserName,
                              showRequired: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return context.translate("required_text");
                                }
                                if (value.length < 4) {
                                  return context.translate("short_text_error");
                                }
                                return null;
                              },
                              onChanged: (value) {
                                BlocProvider.of<WelcomeBloc>(context)
                                    .add(SaveUserName(value));
                              },
                            ),
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
                        child: FilledPrimaryButton.text(
                          label: context.translate("continue_title"),
                          loading: false,
                          onPress: () {
                            if (!_formKey.currentState!.validate()) return;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const SocExerciseInfoPage()));

                            // context.read<RegisterBloc>().add(
                            //       const RegisterEvent.createUsername(
                            //         page: AssessmentTypePage.routeName,
                            //       ),
                            //     );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        }));
  }
}
