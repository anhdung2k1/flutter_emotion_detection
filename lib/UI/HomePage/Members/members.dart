import 'package:flutter/material.dart';

class Member extends StatelessWidget {
  Member({Key? key}) : super(key: key);
  final List<String> entrie_names = <String>['Anh Dũng', 'Nguyễn Trần Anh Đạt','Đình Đức Chung','Phan Công Danh','Nguyễn Trung Dũng','Trần Nguyễn Thiên Bảo','Lý Hoàng Bảo','Vương Nguyễn Tiến Dũng'];
  final List<String> entries_MSSV = <String>['21200065','21200055','21200047','21200051','21200064','21200041','21200038','21200066'];
  final List<String> entries_url = <String>[
    "https://scontent.fdad1-2.fna.fbcdn.net/v/t1.6435-9/152856388_2217721551693547_8820192401419514335_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=730e14&_nc_ohc=IkPxP93XqjkAX_tEPy_&_nc_ht=scontent.fdad1-2.fna&oh=bfbf99c07f976b5142fc42e8bc7d45f5&oe=61C76E45",
    "https://images.unsplash.com/photo-1637966496285-ea1f91852c2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637949599950-40e983bf2457?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637966498276-ba19172b1a06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637958654111-1428977d69ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637912983574-12bb0acd5a74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637996815859-43629ffe6ab9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1637947929413-2a1503b0074e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (BuildContext context, int index){
      return Container(
        padding: const EdgeInsets.only(top:20),
        height: 60,
        child: Row(
          children: [
            CircleAvatar(radius: 30,backgroundImage: NetworkImage(entries_url[index])),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFFCA6F1),
                    Color(0xFFB5FFFF)
                  ])
              ),
              child: Center(
                child: Text('Họ tên: ${entrie_names[index]}\n MSSV: ${entries_MSSV[index]}'),
              ),
            ),
          ],
        ),
      );
    },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: entrie_names.length);
  }
}
