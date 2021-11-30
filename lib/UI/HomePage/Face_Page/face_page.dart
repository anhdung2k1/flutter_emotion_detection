import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:emotion/UI/HomePage/Apps/apps.dart';
import 'package:emotion/UI/HomePage/Members/members.dart';
import 'package:emotion/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import '../../../widgets/navigation_drawer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File? imageFile;
  List? _output;
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
  loadModel() async{
    await Tflite.loadModel(
        model: "assets/models/converted_model.tflite",
        labels: "assets/models/labels.txt"
    );
  }
  @override
  void initState(){
    super.initState();
    loadModel();
  }
  @override
  void dispose(){
    super.dispose();
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
              Row(
                children: [
                  const Icon(Icons.image_outlined),
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
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.camera_outlined),
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
  List<Widget> listWidgets = [const LandingScreen(),Member(),const Apps()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9c27B0),
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
               await FirebaseAuth.instance.signOut();
            }, icon: const Icon(Icons.logout),
              color: Colors.white.withOpacity(0.9),
          )
        ],
      ),
      drawer: const NavigationDrawer(),
      body: listWidgets[currentIndex] == listWidgets[0] ?
         Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFFCA6F1), Color(0xFFB5FFFF)])),
           child: Stack(
            children: <Widget>[
            Center(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (imageFile != null)
                    Image.file(imageFile!,width: 400,height: 400,fit: BoxFit.cover)
                  else Icon(
                    Icons.camera,
                    color: Colors.blue.withOpacity(0.4),
                    size: MediaQuery.of(context).size.width-40),
                const Spacer(),
                  if (_output == null)
                    const Text("Not Detected",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Helvetica Neue',
                        ),)
                  else
                      Text("Result: ${_output!.isNotEmpty ? _output![0]['label'] : ""}" + "\nAccuracy: ${_output!.isNotEmpty ? (_output![0]['confidence'] as double).toStringAsFixed(2) : ""}",
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
                        color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF272343).withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                          ),
                          side: const BorderSide(width: 2,color: Colors.greenAccent)))),
                       ConstrainedBox(
                         constraints: const BoxConstraints.tightFor(width: 150,height: 60),
                          child: ElevatedButton(
                          onPressed: (){
                            runModelOnImage(imageFile!);},
                            child: const Text('Start Detection',
                              style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFD803).withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))))]),
                   const Spacer(flex: 4)]))]))
      : (listWidgets[currentIndex]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home,title: 'Home'),
          TabItem(icon: Icons.people,title: 'Members'),
          TabItem(icon: Icons.apps,title: 'Account'),
        ],
        height: 70,
        onTap: setBottomBarIndex,
        activeColor: Colors.white,
        backgroundColor: const Color(0xFF9c27B0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showChoiceDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}