import 'package:emotion/UI/LogIn/log_in.dart';
import 'package:emotion/routes/routes.dart';
import 'package:emotion/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController(initialPage: 0);
  int indexWalkThrough = 0;
  List<Map<String, String>> walkThroughData = [
    {
      "image1": "assets/images/walk_through_1_1.png",
      "image2": "assets/images/walk_through_1_2.png",
      "text1": "Welcome to IoT App",
      "text2": "Detecting emotion using advance Algorithm?"
    },
    {
      "image1": "assets/images/walk_through_2_1.png",
      "image2": "assets/images/walk_through_2_2.png",
      "text1": "Facial Recognition",
      "text2": "Analyzing and Detecting the person's emotion."
    },
    {
      "image1": "assets/images/walk_through_3_1.png",
      "image2": "assets/images/walk_through_3_2.png",
      "text1": "Realtime Detection",
      "text2": "Customize behaviour treatment."
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return (indexWalkThrough == 0)
        ? InkWell(
          onTap: () {
          setState(() {
           indexWalkThrough++;
            });
          },
          child: const WelcomeScreen(),
        )
          : SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                 flex: 4,
                 child: PageView.builder(
                 controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      indexWalkThrough = value + 1;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) => Content(
                  text1: walkThroughData[index]["text1"].toString(),
                  text2: walkThroughData[index]["text2"].toString(),
                  image1: walkThroughData[index]["image1"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      walkThroughData.length,
                          (index) => buildDot(index: index),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 290,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            "${walkThroughData[indexWalkThrough - 1]["image2"]}",
                            width: size.width,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            width: size.width,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 40),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (indexWalkThrough < 3) {
                                        indexWalkThrough++;
                                        _pageController.animateToPage(
                                          indexWalkThrough - 1,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeIn,
                                        );
                                      } else {
                                        Navigator.pushNamed(context, Routes.LogIn);
                                      }
                                    });
                                  },
                                  child: const DefaultButton(
                                    text: "Get Started",
                                  ),
                                ),
                                const SizedBox(height: 32),
                                InkWell(
                                  onTap: () {
                                      Navigator.pushNamed(context, Routes.LogIn);
                                  },
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: indexWalkThrough - 1 == index
            ? Colors.black
            : const Color.fromARGB(100, 49, 49, 49),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
