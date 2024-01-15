import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 

  const CustomAppBar({
    Key? key,
   
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Farm MS"),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed:  () {},
            ),
            Positioned(
              top: 8.0,
              right: 6.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
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
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
