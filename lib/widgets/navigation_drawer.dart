import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }){
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: (){

      }
    );
  }
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;
    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 65, 108, 1.0),
         Color.fromRGBO(255, 75, 73, 1.0)
          ])
          ),
        child: ListView(
          children: <Widget>[
            buildHeader(urlImage: "https://scontent.fdad1-2.fna.fbcdn.net/v/t1.6435-9/152856388_2217721551693547_8820192401419514335_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=730e14&_nc_ohc=IkPxP93XqjkAX_tEPy_&_nc_ht=scontent.fdad1-2.fna&oh=bfbf99c07f976b5142fc42e8bc7d45f5&oe=61C76E45"
                ,name: "Anh dung", email: "kudung053@gmail.com",
                onClicked: (){
                }
                ),
            const SizedBox(height: 10),
            buildSearchField(),
            const SizedBox(height: 10),
            buildMenuItem(text: 'People', icon: Icons.people),
            buildMenuItem(text: "Favorites", icon: Icons.favorite_border),
            buildMenuItem(text: "Workflow", icon: Icons.workspaces_outlined),
            buildMenuItem(text: "Updates", icon: Icons.update),
            const SizedBox(height: 24),
            const Divider(
              color: Colors.white70,
              thickness: 5,
            ),
            const SizedBox(height: 24),
            buildMenuItem(text: "Plugins", icon: Icons.account_tree_outlined),
            buildMenuItem(text: "Notifications", icon: Icons.notifications_outlined)
        ],
      ),)
    );
  }
}
