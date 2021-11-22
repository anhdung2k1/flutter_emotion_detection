import 'package:emotion/UI/LogIn/sign_in_form.dart';
import 'package:emotion/UI/LogIn/widgets/social_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emotion/UI/LogIn/google_sign_in/google_sign_in.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 40,left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: ((){
                    Navigator.of(context).pop();
                  }),
                ),
                const Spacer(flex: 1),
                const Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      fontFamily: 'Helvetica Neue',
                    color: Color(0xFF9B9B9B),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Welcome Back',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              fontFamily: 'Helvetica Neue',
            ),),
            const SizedBox(height: 12),
            const Text('Sign In with your email and password\n or continue with social media',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w400,
              color: Color(0xFF9B9B9B),
              fontSize: 16
            ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const SignInForm(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                SocialCard(
                  press: () {
                    // ignore: avoid_print
                    print("facebook");
                  },
                  icon: "assets/icons/facebook-2.svg",
                ),
                const SizedBox(width: 20),
                SocialCard(
                  press: () async{
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    await provider.googleLogin();
                  },
                  icon: "assets/icons/google-icon.svg",
                ),
                const SizedBox(width: 20),
                SocialCard(
                  press: (){
                    // ignore: avoid_print
                    print("twitter");
                  },
                  icon: "assets/icons/twitter.svg",
                ),
              ],
            ),
            const Spacer(),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontFamily: 'Helvetica'),
                children: [
                  TextSpan(
                    text: 'Don\'t have an account ? ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Helvetica',
                      color: Colors.grey
                    )
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                      fontSize: 18
                    )
                  )
                ]
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

