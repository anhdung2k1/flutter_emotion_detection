import 'package:emotion/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LogInSucess extends StatelessWidget {
  const LogInSucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 40,left: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                  },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Spacer(),
                const Text('Login Success',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.grey
                ),),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 80),
            Image.asset('assets/images/successful.png',
            width: size.width/3,
              height: size.height/3,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 80),
            const Text(
              'You are successfully Log In \n Click the button below to entry',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                shadows:<Shadow> [
                  Shadow(
                    offset: Offset(6,0),
                    blurRadius: 6.0,
                    color: Colors.black26,)
                ]
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
                constraints:
                const BoxConstraints.tightFor(width: 300,height: 50),
                child: ElevatedButton(
                  onPressed: (){
                      Navigator.pushNamed(context,Routes.FacePage);
                    },
                  child: const Text('Back To HomeTown',
                    style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
