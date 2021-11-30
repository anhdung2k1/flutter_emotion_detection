import 'package:emotion/UI/LogIn/google_sign_in/google_sign_in.dart';
import 'package:emotion/UI/LogIn/sign_in_form.dart';
import 'package:emotion/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      key: _formKey,
        color: Colors.black,
        child: Container(
          padding: const EdgeInsets.only(top: 40,left: 12),
          child: Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  ConstrainedBox(
                      constraints:
                      const BoxConstraints.tightFor(width: 50,height: 50),
                      child: ElevatedButton(
                        onPressed: () async{
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_ios,color: Colors.white),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            side: BorderSide(width: 2,color: Colors.white70.withOpacity(0.2))
                        ),
                      )
                  ),
                  const Spacer(flex:1),
                  const Text(
                    'Log in',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica Neue',
                        color: Colors.white
                    ),
                  ),
                  const Spacer(flex:2)
                ],
              ),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Log in with one of following options.',
                  style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70
                  ),),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                      constraints:
                      const BoxConstraints.tightFor(width: 180,height: 70),
                      child: ElevatedButton(
                        onPressed: () async{
                          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                          await provider.googleLogin();
                        },
                        child: SvgPicture.asset("assets/icons/google-icon.svg",width: 30,height: 30),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            side: BorderSide(width: 2,color: Colors.white70.withOpacity(0.2))
                        ),
                      )
                  ),
                  ConstrainedBox(
                      constraints:
                      const BoxConstraints.tightFor(width: 180,height: 70),
                      child: ElevatedButton(
                        onPressed: () async{
                          print("Facebook");
                        },
                        child: SvgPicture.asset("assets/icons/facebook-2.svg",width: 30,height: 30),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            side: BorderSide(width: 2,color: Colors.white70.withOpacity(0.2))
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignInForm(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Helvetica Neue',
                              fontSize: 18,
                              color: Colors.white70
                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushNamed(Routes.SignUp);
                        },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Helvetica Neue',
                                color: Colors.white,
                              ),
                            ))],)],),)
            ],
          ),
        )
    );
  }
}