import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 

  const CustomAppBar({
    Key? key,
   
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Farm MS"),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed:  () {},
            ),
            Positioned(
              top: 8.0,
              right: 6.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  '3', // Replace with your actual notification count
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap:  () {},
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
