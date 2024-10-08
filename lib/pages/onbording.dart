import 'dart:html';

import 'package:courses_app/models/onbording_items.dart';
import 'package:courses_app/pages/sign_up.dart';
import 'package:courses_app/services/prefe_service.dart';
import 'package:courses_app/widgets/app_button.dart';
import 'package:courses_app/widgets/carsouse_indecator.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingItems();
  final pageController = PageController();
  Color color1 = Color.fromARGB(255, 207, 204, 204);
  Color color2 = Color.fromARGB(255, 207, 204, 204);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: ((context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(''),
                        TextButton(
                            onPressed: () => pageController
                                .jumpToPage(controller.items.length),
                            child: Text('Skip'))
                      ],
                    ),
                  ),
                  Image.asset(
                    controller.items[index].image,
                    height: 300,
                  ),
                  Text(
                    controller.items[index].title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(controller.items[index].description),
                  SizedBox(height: 50),
                  BuildCarsourelIndecator(
                      imageNum: controller.items.length, currentImage: index),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: color1),
                          child: index == 0
                              ? const Text('')
                              : IconButton(
                                  onPressed: () {
                                    pageController.previousPage(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 600));
                                    color1 = Colors.amber;
                                    color2 = Color.fromARGB(255, 207, 204, 204);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.arrow_back),
                                ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: color2),
                          child: index == 3
                              ? AppButton(
                                  name: 'Sign Up',
                                  onPressed: () async {
                                    PreferencesService.isOnBoardingSeen = true;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => SignUpPage()));
                                  },
                                )
                              : IconButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 600));
                                    color2 = Colors.amber;
                                    color1 = Color.fromARGB(255, 207, 204, 204);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            })));
  }
}
