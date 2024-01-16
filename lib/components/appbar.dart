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
              icon: const Icon(Icons.notifications, color: Colors.orange,),
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
            child:  CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://imgs.search.brave.com/oBQTGay0Yf8nPSlCY5_NNNLX_XkVmND6z3EI4c7Z6MM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2NzgzNDQx/NzcyNTAtYmZkYmVk/ODlmYzAzP3E9ODAm/dz0xMDAwJmF1dG89/Zm9ybWF0JmZpdD1j/cm9wJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OFptRnliV1Z5/ZkdWdWZEQjhmREI4/Zkh3dw.jpeg"),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
