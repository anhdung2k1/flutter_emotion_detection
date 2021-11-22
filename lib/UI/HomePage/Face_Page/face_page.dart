import 'package:emotion/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'BNBCustomPainter.dart';
import 'navigation_drawer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File? imageFile;
  List? _output;

  loadModel() async{
    await Tflite.loadModel(
        model: "assets/models/converted_model.tflite",
        labels: "assets/models/labels.txt"
    );
  }
  runModelOnImage(File image)async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
      numResults: 2,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.5
    );
    setState(() {
      _output = output;
    });
  }
  @override
  void initState(){
    super.initState();
    loadModel();
  }
  Future<void>_openCamera(BuildContext context) async{
    XFile? picture = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1080,
        maxWidth: 1080,
    );
    setState(() {
      imageFile = File(picture!.path);
    });
    Navigator.of(context).pop();
  }
  Future<void>_openGallary(BuildContext context) async {
    XFile? picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(picture!.path);
    });
    Navigator.of(context).pop();
  }
  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Select Methods',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.bold
        ),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: const Text("Gallery",
              style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 16,
              fontWeight: FontWeight.w400,)),
                onTap: (){
                  _openGallary(context);
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: const Text("Camera",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                ),),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          ),
        )
      );
    });
  }
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.camera),
            Text("Camera",
              style: TextStyle(
                fontSize:24,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: ()async{
              // await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, Routes.LogIn);
            }, icon: const Icon(Icons.logout),
              color: Colors.white.withOpacity(0.9),
          )
        ],
      ),
      drawer: const NavigationDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFCA6F1),
            Color(0xFFB5FFFF)
          ])
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                if (imageFile != null)
                  Image.file(imageFile!,width: 420,height: 460,fit: BoxFit.cover)
                else Icon(
                 Icons.camera,
                 color: Colors.blue.withOpacity(0.4),
                 size: MediaQuery.of(context).size.width,
                    ),
                const Spacer(),
                if (_output == null)
                  const Text("Not Detected",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Helvetica Neue',
                  ),)
                else
                  Text("Result: ${_output![0]["label"]}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Helvetica Neue'
                  ),),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 150,height: 60),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(Routes.FacePage);
                        },
                        child: const Text('Cancel',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.white
                          ),),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF272343).withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                          side: const BorderSide(width: 2,color: Colors.greenAccent)
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 150,height: 60),
                      child: ElevatedButton(
                        onPressed: (){
                          runModelOnImage(imageFile!);
                        },
                        child: const Text('Start Detection',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.black
                        ),),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFD803).withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 const Spacer(flex: 2)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFFCA6F1),
              Color(0xFFB5FFFF)
            ])
        ),
        child: Stack(
          clipBehavior: Clip.none, children: <Widget>[
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width,80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: ConstrainedBox(
                      constraints:
                      const BoxConstraints.tightFor(width: 68,height: 65),
                      child: ElevatedButton(
                        onPressed: (){
                          _showChoiceDialog(context);
                        },
                        child: const Icon(Icons.camera_outlined,size:38),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF6246EA).withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                            ),
                          side: const BorderSide(width: 3,color: Colors.blueGrey)
                        ),
                      ),
                  ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.pink,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.home_outlined,
                          size: 40,
                        color: currentIndex == 1 ? Colors.green.shade400 : Colors.lime,
                      ),
                      onPressed: (){
                        setBottomBarIndex(1);
                        Navigator.of(context).pushNamed(Routes.FacePage);
                      },
                    ),
                  ),
                  const SizedBox(width: 40),
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.redAccent,
                        shape: CircleBorder()),
                    child: IconButton(
                      icon: Icon(Icons.people_outlined,
                          size: 40,
                          color: currentIndex == 2 ? Colors.lime : Colors.green.shade400,
                      ),
                      onPressed: (){
                        setBottomBarIndex(2);
                      },
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
}