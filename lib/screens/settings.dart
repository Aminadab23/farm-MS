import 'package:farms/components/appbar.dart';
import 'package:farms/models/user_model.dart';
import 'package:farms/screens/login.dart';
import 'package:farms/screens/notification_settings.dart';
import 'package:farms/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  final User user;
  const Settings({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(
                size: 24,
                Icons.person_outline,
                color: Colors.orange,
              ),
              title: const Text('Profile',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: const Text("Edit your Profile",
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 50),
                    fontSize: 16,
                  )),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
              onTap: () {
                Get.to(ProfilePage(
                  user: user,
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                size: 24,
                Icons.lock_outline,
                color: Colors.orange,
              ),
              title: const Text('Change Password',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: const Text("Update your password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 50),
                    fontSize: 16,
                  )),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
              onTap: () {
                Get.to(ChangePassword(
                  user: user,
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                size: 24,
                Icons.notifications_active_sharp,
                color: Colors.orange,
              ),
              title: const Text('Notification',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: const Text("Change your notification preference",
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 50),
                    fontSize: 16,
                  )),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
              onTap: () {
                Get.to(NotificationSettingsScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                size: 24,
                Icons.help_outline_rounded,
                color: Colors.orange,
              ),
              title: const Text('Help And Support',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: const Text("Need Assistance?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 50),
                    fontSize: 16,
                  )),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
              onTap: () {
                Get.to(ProfilePage(
                  user: user,
                ));
              },
            ),
            ListTile(
                leading: const Icon(
                  size: 24,
                  Icons.logout_outlined,
                  color: Colors.orange,
                ),
                title: const Text('Logout',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text("To sign out of your account",
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 50),
                      fontSize: 16,
                    )),
                // trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange, ),
                onTap: () {
                  Get.to(const Login())?.then((result) {
                    if (result == null) {
                      Get.until((route) => false);
                    }
                  });
                }),
          ],
        ));
  }
}
