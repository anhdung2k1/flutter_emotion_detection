import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 42),
            Image(image: const AssetImage('assets/images/logo.png'),
            width: size.width/3,
            height: 120),
            const SizedBox(height: 12),
            const Text('IoT App',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                fontSize: 48,
                color: Color(0xFF010101),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(12,0),
                    blurRadius: 12.0,
                    color: Colors.black26,
                  )
                ]
              ),),
          ],
        ),
      ),
    );
  }
}
