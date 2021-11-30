import 'package:emotion/UI/LogIn/log_in.dart';
import 'package:emotion/UI/LoginSucess/login_sucess.dart';
import 'package:emotion/UI/Welcome%20Screen/walking_through.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState != ConnectionState.active){
          return const Center(child: CircularProgressIndicator());
        }
        final user = snapshot.hasData;
        if (user && FirebaseAuth.instance.currentUser!.emailVerified == true) {
          print("user is logged in");
          return LogInSucess();
        }
        else if(snapshot.hasError){
          return LogIn();
        }
        else{
          return const WalkThroughScreen();
        }
      },
    ),
  );
}
