import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../screens/dashboard.dart';
import '../screens/farms_list.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
      DrawerHeader(
  margin: EdgeInsets.zero,
  padding: EdgeInsets.zero,
  child: Container(
    child: Container(
      padding: EdgeInsets.all(25), child: CircleAvatar()),
    width: double.infinity,
    height: 200.0,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 250, 155, 14),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(1000.0),
      ),
    ),
  ),
),

          ListTile(
            leading: Icon(Icons.home, color: Color.fromARGB(255, 41, 224, 111)),
            title: Text('Home'),
            onTap: () {
              Get.to(Dashboard());
            },
          ),
          ListTile(
                        leading: Icon(Mdi.crop, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Farms'),
            onTap: () {
              // Handle navigation to farms
               Get.to(FarmLists());
            },
          ),
          ListTile(
            leading: Icon(Icons.cases, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Jobs'),
            onTap: () {
              // Handle navigation to jobs
              Navigator.pop(context);
            },
          ),
          ListTile(
                     leading: Icon(Mdi.hardHat, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Harvest'),
            onTap: () {
              // Handle navigation to harvest
              Navigator.pop(context);
            },
          ),
          ListTile(
                       leading: Icon(Icons.add_task, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Add/Edit'),
            onTap: () {
              // Handle navigation to add/edit
              Navigator.pop(context);
            },
          ),
          ListTile(
                      leading: Icon(Icons.person, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Profile'),
            onTap: () {
              // Handle navigation to profile
              Navigator.pop(context);
            },
          ),
          ListTile(
                      leading: Icon(Icons.settings, color: Color.fromARGB(255, 41, 224, 111)),

            title: Text('Settings'),
            onTap: () {
              // Handle navigation to settings
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
