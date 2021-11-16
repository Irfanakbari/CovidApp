import 'package:appscovid/Services/getdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final String _tel = 'tel:116';

  _tele() async => await canLaunch(_tel)
      ? await launch(_tel)
      : throw 'Could not launch $_tel';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(71, 63, 151, 1)),
            accountName: const Text('Jimmi'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/img/profil.png'),
            ),
            accountEmail: FutureBuilder<String?>(
              future: GetData.getEmail(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Text('Loading...');
                } else {
                  return Text(snapshot.data!);
                }
              },
            ),
          ),
          DrawerListTile(
              iconData: Icons.person, title: "Profil", onTilePressed: () {}),
          DrawerListTile(
              iconData: Icons.list,
              title: "Daftar RS Rujukan",
              onTilePressed: () {}),
          DrawerListTile(
              iconData: Icons.location_on,
              title: "Data Per Provinsi",
              onTilePressed: () {}),
          DrawerListTile(
            iconData: Icons.call,
            title: "Hotline Gugus Covid",
            onTilePressed: () {
              _tele();
            },
          ),
          DrawerListTile(
              iconData: Icons.question_answer,
              title: "About App",
              onTilePressed: () {}),
          DrawerListTile(
            iconData: Icons.logout,
            title: "Sign Out",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
