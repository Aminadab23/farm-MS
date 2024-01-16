import 'package:farms/models/user_model.dart';
import 'package:farms/screens/notes_list.dart';
import 'package:farms/screens/profile.dart';
import 'package:farms/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../screens/dashboard.dart';
import '../screens/farms_list.dart';
import '../screens/harvest_list.dart';

class MyDrawer extends StatelessWidget {
  User user = User(
      first_name: "Yeabsra",
      last_name: "Ayehualme",
      email: "yeabman32@gmai.com",
      profPic:
          "https://imgs.search.brave.com/oBQTGay0Yf8nPSlCY5_NNNLX_XkVmND6z3EI4c7Z6MM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2NzgzNDQx/NzcyNTAtYmZkYmVk/ODlmYzAzP3E9ODAm/dz0xMDAwJmF1dG89/Zm9ybWF0JmZpdD1j/cm9wJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OFptRnliV1Z5/ZkdWdWZEQjhmREI4/Zkh3dw.jpeg");

  MyDrawer({super.key});
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
                  border: Border(bottom: BorderSide(color: Colors.transparent)),
                  color: Color.fromARGB(255, 250, 155, 14),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(1000.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: 50,
                  height: 50,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,

                    // foregroundImageFit: BoxFit.cover,
                    foregroundImage: const NetworkImage(
                      "https://imgs.search.brave.com/oBQTGay0Yf8nPSlCY5_NNNLX_XkVmND6z3EI4c7Z6MM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2NzgzNDQx/NzcyNTAtYmZkYmVk/ODlmYzAzP3E9ODAm/dz0xMDAwJmF1dG89/Zm9ybWF0JmZpdD1j/cm9wJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OFptRnliV1Z5/ZkdWdWZEQjhmREI4/Zkh3dw.jpeg",
                    ),
                  ),
                ),
              )),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.orange,
            ),
            title: const Text('Home'),
            onTap: () {
              Get.to(const Dashboard());
            },
          ),
          ListTile(
            leading: const Icon(
              Mdi.crop,
              color: Colors.orange,
            ),
            title: const Text('Farms'),
            onTap: () {
              // Handle navigation to farms
              Get.to(const FarmLists());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.cases,
              color: Colors.orange,
            ),
            title: const Text('Jobs'),
            onTap: () {
              // Handle navigation to jobs
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Mdi.hardHat,
              color: Colors.orange,
            ),
            title: const Text('Harvest'),
            onTap: () {
              Get.to(const HarvestList());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_task,
              color: Colors.orange,
            ),
            title: const Text('Notes'),
            onTap: () {
              Get.to(const Notes());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.orange,
            ),
            title: const Text('Profile'),
            onTap: () {
              Get.to(ProfilePage(user: user));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.orange,
            ),
            title: const Text('Settings'),
            onTap: () {
              Get.to(Settings(
                user: user,
              ));
            },
          ),
        ],
      ),
    );
  }
}
