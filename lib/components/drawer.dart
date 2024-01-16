import 'package:farms/screens/notes_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../screens/dashboard.dart';
import '../screens/farms_list.dart';
import '../screens/harvest_list.dart';

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
              width: double.infinity,
              height: 200.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 250, 155, 14),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(1000.0),
                ),
              ),
              child: Container(
                  padding: const EdgeInsets.all(25),
                  child: const CircleAvatar()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Home'),
            onTap: () {
              Get.to(const Dashboard());
            },
          ),
          ListTile(
            leading:
                const Icon(Mdi.crop, color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Farms'),
            onTap: () {
              // Handle navigation to farms
              Get.to(const FarmLists());
            },
          ),
          ListTile(
            leading: const Icon(Icons.cases,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Jobs'),
            onTap: () {
              // Handle navigation to jobs
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Mdi.hardHat,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Harvest'),
            onTap: () {
              Get.to(HarvestList());
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Notes'),
            onTap: () {
              Get.to(NotesList());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Profile'),
            onTap: () {
              // Handle navigation to profile
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,
                color: Color.fromARGB(255, 41, 224, 111)),
            title: const Text('Settings'),
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
