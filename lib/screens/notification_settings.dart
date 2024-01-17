
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool pushNotificationEnabled = false;
  bool smsNotificationEnabled = false;

  void _resetSettings() {
    setState(() {
      pushNotificationEnabled = false;
      smsNotificationEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text('Push Notification'),
              subtitle: const Text('Tap to enable'),
              trailing: Switch(
                value: pushNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    pushNotificationEnabled = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  pushNotificationEnabled = !pushNotificationEnabled;
                });
              },
            ),
            ListTile(
              title: const Text('SMS Notification'),
              subtitle: const Text('Tap to enable'),
              trailing: Switch(
                value: smsNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    smsNotificationEnabled = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  smsNotificationEnabled = !smsNotificationEnabled;
                });
              },
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _resetSettings,
              child: Container(
                width: 80,
                height: 50,
                decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(child: Text('Reset Settings',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),))),
            ),
          ],
        ),
      ),
    );
  }
}


