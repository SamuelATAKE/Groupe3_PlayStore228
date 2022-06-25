import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Connectez-vous'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/User Icon.svg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Facebook'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.ondemand_video_rounded),
            title: Text('Youtube'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Twitter'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contacter'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Partager'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Notez-nous'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Confidentialités'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('A propos'),
            leading: Icon(Icons.info),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Aide'),
            leading: Icon(Icons.help),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Quitter'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
