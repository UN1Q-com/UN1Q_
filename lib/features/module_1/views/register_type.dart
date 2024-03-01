import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/styled_widgets/buttons/radio_buttons/radio_button.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_bloc.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_event.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_state.dart';
import "package:un1que_new/features/module_1/views/user_name_screen.dart";

class RegisterTypePage extends StatefulWidget {
  const RegisterTypePage({super.key});

  static const routeName = '/register-type';

  @override
  State<RegisterTypePage> createState() => _RegisterTypePageState();
}

class _RegisterTypePageState extends State<RegisterTypePage> {
  final groupsValue = <String>["professional", "individual"];
  String currentValue = "professional";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WelcomeBloc>().add(LoadFormInputEvent());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // BlocProvider.of<WelcomeBloc>(context)
                //     .add(DeleteDataEvent("register"));
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              )),
        ),
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (ctx, state) {
          if (state is LoadedFormState) {
            final data = state.data
                .where((element) => element.options.length > 1)
                .toList();
            (data.first.options.first.selected)
                ? currentValue = "professional"
                : currentValue = "individual";
            return SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: ThemeSpacing.xxlg),
                        Text(
                          data.first.questionTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: ThemeSpacing.lg),
                        RadioButton(
                          enabled: true,
                          subtitle: data.first.options.first.text,
                          value: groupsValue.first,
                          groupValue: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value!;
                            });
                            context
                                .read<WelcomeBloc>()
                                .add(SelectProfessionalOptionEvent());
                          },
                        ),
                        const SizedBox(height: ThemeSpacing.md),
                        RadioButton(
                          enabled: true,
                          subtitle: data.first.options.last.text,
                          value: groupsValue.last,
                          groupValue: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value!;
                            });
                            context
                                .read<WelcomeBloc>()
                                .add(SelectIndividualOptionEvent());
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
                            // BlocProvider.of<WelcomeBloc>(context)
                            //     .add(AddDataEvent("userName"));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const UsernamePage()));
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
        }));
  }
}
