import 'package:emotion/Authentication/authentication.dart';
import 'package:emotion/UI/LogIn/google_sign_in/google_sign_in.dart';
import 'package:emotion/UI/LogIn/widgets/form_error.dart';
import 'package:emotion/helper/keyboard.dart';
import 'package:emotion/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;
  String? password;
  String? name;
  bool? remember = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  void addError({required String error}){
    if(!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  TextFormField buildEmailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: "Please Enter your Email");
        }
        return;
      },
      validator: (value){
        if(value!.isEmpty){
          addError(error: "Please Enter your Email");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.mail_outlined,color: Colors.white.withOpacity(0.6)),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 42,vertical: 20
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 2,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 2,
          )
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: "Please Enter your Password");
        }
        else if(value.length >= 8){
          removeError(error: "Password is too short");
        }
        return;
      },
      validator: (value){
        if(value!.isEmpty){
          addError(error: "Please Enter your Password");
          return "";
        }
        else if(value.length < 8){
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outlined,color:Colors.white.withOpacity(0.6)),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 42,vertical: 20
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 5,
          )
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
  TextFormField buildNameFormField(){
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: "Please Enter your Name");
        }
        return;
      },
      validator: (value){
        if(value!.isEmpty){
          addError(error: "Please Enter your Name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.people_outlined,color: Colors.white.withOpacity(0.6)),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 42,vertical: 20
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 2,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
            gapPadding: 2,
          )
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
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
                            Navigator.of(context).pushNamed(Routes.LogIn);
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
                      'Sign Up',
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
              const SizedBox(height: 45),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Sign up with one of following options.',
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
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      buildNameFormField(),
                      const SizedBox(height: 20),
                      buildEmailFormField(),
                      const SizedBox(height: 20),
                      buildPasswordFormField(),
                      const SizedBox(height: 20),
                      FormError(errors: errors),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 400,height: 70),
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              KeyboardUtil.hideKeyboard(context);
                              Navigator.of(context).pushNamed(Routes.LogIn);
                            }
                            signup(email!, password!);
                          },
                          child: const Text('Create Account',
                            style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFb91372),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              side: const BorderSide(width: 2,color: Color(0xFFb91372))
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Helvetica Neue',
                              fontSize: 18,
                              color: Colors.white70
                            ),
                          ),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushNamed(Routes.LogIn);
                          },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Helvetica Neue',
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
        ),
      )
    );
  }
}

