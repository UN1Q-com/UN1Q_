import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:un1que_new/app_localization.dart';
import 'package:un1que_new/features/excercice_soc/bloc/ecercise_bloc.dart';
import 'package:un1que_new/features/excercice_soc/bloc/exercice_event.dart';
import 'package:un1que_new/features/excercice_soc/services/excercie_form_input_service.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_bloc.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_event.dart';
import 'package:un1que_new/features/module_1/bloc/welcome_state.dart';
import 'package:un1que_new/features/module_1/services/form_input_service.dart';
import 'package:un1que_new/features/module_1/views/welcome_screen.dart';

import 'core/theme/theme.dart';

Future<void> main() async {
  /// hive database initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void routing(BuildContext context)  {
  //   // final helper = RepositoryProvider.of<FormInputService>(context);
  //   final helper = BlocProvider.of<WelcomeBloc>(context).service;
  //   final dataKeys =  helper.getKeys();
  //   if (dataKeys.contains("register") && !dataKeys.contains("userName")) {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (ctx) => const RegisterTypePage()));
  //   }
  //   if (!dataKeys.contains("register") && dataKeys.contains("userName")) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (ctx) => const UsernamePage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FormInputService>(
            create: (context) => FormInputService()),
        RepositoryProvider<ExerciseFormInputService>(
            create: (context) => ExerciseFormInputService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (ctx) =>
                WelcomeBloc(RepositoryProvider.of<FormInputService>(ctx))
                  ..add(RegistrationFormInputEvent()),
          ),
          BlocProvider(
            lazy: false,
            create: (ctx) => ExerciseBloc(
                RepositoryProvider.of<ExerciseFormInputService>(ctx))
              ..add(ExerciseRegistrationFormInputEvent()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: AppThemeConstants.darkTheme(),

            ///default language
            locale: const Locale("en"),
            supportedLocales: const [
              Locale('fr'),
              Locale('en'),
              Locale('es'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppThemeConstants.lightTheme(),
            home: BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
              //routing(context);
              return const WelcomePage();
            })),
      ),
    );
  }
}
