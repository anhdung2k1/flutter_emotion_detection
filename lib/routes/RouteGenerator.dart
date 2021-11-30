import 'package:emotion/UI/HomePage/Face_Page/face_page.dart';
import 'package:emotion/UI/LogIn/log_in.dart';
import 'package:emotion/UI/LoginSucess/login_sucess.dart';
import 'package:emotion/UI/Sign%20Up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:emotion/routes/routes.dart';
import 'package:emotion/UI/Welcome%20Screen/body/welcome_screen.dart';

class RouteGenerator{
  static RouteGenerator? _instance;
  RouteGenerator._();
  factory RouteGenerator(){
    _instance ??= RouteGenerator._();
    return _instance!;
  }
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.WelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.LogIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case Routes.LoginSuccess:
        return MaterialPageRoute(builder: (_) => const LogInSucess());
      case Routes.SignUp:
        return MaterialPageRoute(builder: (_)=> const SignUp());
      case Routes.FacePage:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      default:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}