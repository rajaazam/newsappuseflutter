import 'package:bbcnews/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:bbcnews/pages/Login.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Azam Khan'),
            accountEmail: Text('kacho@gmail.com'),
            currentAccountPicture: CircleAvatar(
                child: Image(
              image: AssetImage(
                'assets/images/avatar.png',
              ),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: Icon(Icons.location_city_outlined),
            title: Text('Address'),
            subtitle: Text('Gulshan iqbal karachi block 11'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Detail'),
            subtitle: Text('1500 '),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit profile'),
          ),
          ListTile(
              leading: Icon(Icons.settings_applications),
              title: Text('Settings'),
              onTap: () {}),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // change app state...
              Navigator.pop(context); // close the drawer
            },
          )
        ],
      ),
    );
  }
}
