import 'package:flutter/material.dart';
import 'package:flutter_node_store/app_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Sarawut Chamchoy'),
                  accountEmail: Text('offmodifly@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/samitk.jpg'),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/noavartar.png'),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Info'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.info);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text('About'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.about);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text('Contact'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.contact);
                  },
                ),
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text('Logout'),
                  onTap: (){
                    
                  },
                )
              ],
            )),
          ],
        ),
      ),
      body: Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
