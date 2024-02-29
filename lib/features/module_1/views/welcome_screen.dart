// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:un1que_new/core/extensions/extension.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Package imports:
import 'package:un1que_new/features/module_1/views/register_type.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static const routeName = '/welcome';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  int _secs = 0;
  Timer? _timer;
  final _controller = CarouselController();

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        setState(() {
          _secs += 1;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quotes = <String>[
      context.translate("header_1"),
      context.translate("header_2"),
      context.translate("header_3"),
      context.translate("header_4"),
    ];
    final authors = <String>[
      context.translate("author_1"),
      context.translate("author_2"),
      context.translate("author_3"),
      context.translate("author_4"),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 634,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 100),
                child: Stack(
                  children: [
                    CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 900,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          onPageChanged: (index, rs) {
                            _secs = 0;
                            _timer?.cancel();
                            _timer = Timer.periodic(
                              const Duration(milliseconds: 1),
                              (timer) {
                                setState(() {
                                  _secs += 1;
                                });
                              },
                            );
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        carouselController: _controller,
                        items: [
                          Image.network(
                            "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1055909952.jpg?crop=0.385xw:0.577xh;0.256xw,0.0168xh&resize=640:*",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.network(
                            "https://www.herbalife.com/dmassets/regional-reusable-assets/emea/images/fi-woman-home-workout-emea.jpg",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.network(
                            "https://www.cnet.com/a/img/resize/09520518a213749386eb666685a1ef3602001193/hub/2023/04/18/084135ae-9c93-4d44-ba8a-8a57436b77bf/gettyimages-1265599567-1.jpg?auto=webp&fit=crop&height=1200&width=1200",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.network(
                            "https://www.fitnesstechstore.fr/cdn/shop/files/Banner_FT_01_1400x.jpg?v=1674027340",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 29,
                        vertical: 40,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quotes[_currentIndex],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            authors[_currentIndex],
                            style: const TextStyle(
                              color: Color(0XFF00F2DE),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _controller.animateToPage(i),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 4,
                              margin: EdgeInsets.only(
                                right: i == quotes.length ? 0 : 4,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: _currentIndex > i
                                    ? Colors.white
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                              child: _currentIndex == i
                                  ? LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      color: Colors.white,
                                      value: _secs / 2500,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: ThemeSpacing.sm,
                left: ScreenPadding.horizontal.left,
                right: ScreenPadding.horizontal.right,
                bottom: MediaQuery.of(context).padding.bottom + ThemeSpacing.sm,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // BlocProvider.of<WelcomeBloc>(context)
                        //     .add(AddDataEvent("register"));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const RegisterTypePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColors.secondary,
                        fixedSize: const Size(500, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Text(
                        context.translate("get_started_title"),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  const SizedBox(height: ThemeSpacing.md),
                  Center(
                      child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.translate("have_account_question"),
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(context.translate("log_in"),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
