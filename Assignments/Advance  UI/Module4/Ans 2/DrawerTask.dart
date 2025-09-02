import 'package:flutter/material.dart';
import '../../../Assignments/HomeScreen.dart';
import '../../../Assignments/ProfileScreen.dart';
import '../../../Assignments/SettingsScreen.dart';
import 'DrawerScreen1.dart';
import 'DrawerScreen2.dart';

class Drawertask extends StatefulWidget {
  const Drawertask({super.key});

  @override
  State<Drawertask> createState() => _DrawertaskState();
}

class _DrawertaskState extends State<Drawertask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Task'),
        centerTitle: true,
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepOrange),
                accountName: Text('Drawer'),
                accountEmail: Text('DrawerTask@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text('D', style: TextStyle(fontSize: 25)),
                ),
              ),
              showMenu(Icon(Icons.home), 'Home', Drawerscreen1()),
              showMenu(Icon(Icons.person_2_rounded), 'Profile', Drawerscreen2()),
              showMenu(Icon(Icons.settings), 'Settings', Settingsscreen()),
            ],
          ),
        )
    );
  }

  showMenu(icon, title, screen) {
    return ListTile(
      title: Text(title),
      leading: icon,
      iconColor: Colors.black,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
