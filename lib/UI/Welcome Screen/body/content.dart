import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key? key,
    required this.image1,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String image1, text1,text2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const Spacer(),
        Container(
          height: 240,
          child: Image.asset(
            "$image1",
            width: size.width*0.8,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          '$text1',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'
          ),
        ),
        const SizedBox(height: 9),
        Text(
          '$text2',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
