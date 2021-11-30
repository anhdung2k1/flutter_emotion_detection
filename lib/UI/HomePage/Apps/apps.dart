import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              ConstrainedBox(constraints:
               BoxConstraints.tightFor(
                  width: size.width, height: size.height/4
                ),
              child: ElevatedButton(
               onPressed: (){},
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: const [
                    CircleAvatar(radius: 40,backgroundImage: NetworkImage("https://scontent.fdad1-2.fna.fbcdn.net/v/t1.6435-9/152856388_2217721551693547_8820192401419514335_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=730e14&_nc_ohc=IkPxP93XqjkAX_tEPy_&_nc_ht=scontent.fdad1-2.fna&oh=bfbf99c07f976b5142fc42e8bc7d45f5&oe=61C76E45")),
                   const SizedBox(width: 30),
                   Text('TRAN ANH DUNG',
                    style: TextStyle(fontWeight: FontWeight.w400,
                    fontSize: 24,
                    fontFamily: 'Helvetica Neue',
                    color: Colors.black),
                    )
                 ],
               ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                )))),
              ConstrainedBox(constraints:
              BoxConstraints.tightFor(
                  width: size.width, height: size.height/2
              ),
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.security,color: Colors.grey,size: 40),
                                  TextButton(
                                    child: const Text('Terms of use',
                                    style: TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 24,
                                        fontFamily: 'Helvetica Neue',
                                        color: Colors.black87),
                                  ),
                                    onPressed: (){}),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  const Icon(Icons.language,color: Colors.grey,size: 40),
                                  TextButton(
                                    child: const Text('Language',
                                    style: TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 24,
                                        fontFamily: 'Helvetica Neue',
                                        color: Colors.black87),),
                                    onPressed: (){}),
                                ],
                              ),
                              const SizedBox(height: 30),
                                Row(
                                  children: [
                                    const Icon(Icons.comment,color: Colors.grey,size: 40),
                                    TextButton(
                                      child: const Text('Social Care',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          fontFamily: 'Helvetica Neue',
                                          color: Colors.black87)),
                                      onPressed: (){}),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}
