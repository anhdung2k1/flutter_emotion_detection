import 'package:emotion/Authentication/authentication.dart';
import 'package:emotion/UI/LogIn/widgets/form_error.dart';
import 'package:emotion/helper/keyboard.dart';
import 'package:emotion/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}
class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            const SizedBox(height: 20),
            buildPasswordFormField(),
            const SizedBox(height: 20),
            FormError(errors: errors),
            const SizedBox(height: 20),
            ConstrainedBox(
                constraints:
                const BoxConstraints.tightFor(width: 400,height: 70),
                child: ElevatedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      KeyboardUtil.hideKeyboard(context);
                    }
                    setState((){
                      signin(email!, password!);
                      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
                        if(user == null){
                          print("User is currently signed out");
                        }
                        else{
                          print("Logged in");
                          Navigator.of(context).pushNamed(Routes.LoginSuccess);
                        }
                      });
                    });
                  },
                  child: const Text('Log In',
                    style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFb91372),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                )
            )
          ],
        )
    );
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
        suffixIcon: const Icon(Icons.mail_outlined),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 42,vertical: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
          gapPadding: 10,
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
        suffixIcon: const Icon(Icons.lock_outlined),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 42,vertical: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF9B9B9B)),
          gapPadding: 10,
        )
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}