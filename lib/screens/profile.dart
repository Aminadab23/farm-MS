import 'package:farms/components/appbar.dart';
import 'package:farms/components/inputfields.dart';
import 'package:farms/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final TextEditingController fname;
  final TextEditingController lname;
  final TextEditingController email;
  final String imageUrl;

  ProfilePage({Key? key, required this.user})
      : fname = TextEditingController(text: user.first_name),
        lname = TextEditingController(text: user.last_name),
        email = TextEditingController(text: user.email),
        imageUrl = user.profPic,
        super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: const Text("Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
             Center(
  child: Container(
    width: 100, 
    height: 100, 
    child: CircleAvatar(
      radius: 50, 
      backgroundColor: Colors.transparent, 
     
      // foregroundImageFit: BoxFit.cover,
      foregroundImage: NetworkImage(
        "https://imgs.search.brave.com/oBQTGay0Yf8nPSlCY5_NNNLX_XkVmND6z3EI4c7Z6MM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2NzgzNDQx/NzcyNTAtYmZkYmVk/ODlmYzAzP3E9ODAm/dz0xMDAwJmF1dG89/Zm9ybWF0JmZpdD1j/cm9wJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OFptRnliV1Z5/ZkdWdWZEQjhmREI4/Zkh3dw.jpeg",
      ),
    ),
  ),
),

            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: InputField(
                  label: "First Name",
                  controller: fname,
                  validator: Validator.name),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: InputField(
                  label: "Last Name",
                  controller: lname,
                  validator: Validator.name),
            ),
             Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: InputField(
                  label: "email",
                  controller: email,
                  validator: Validator.name),
            ),
          ]),
        ));
  }
}



class ChangePassword extends StatelessWidget {
  final User user;
  final TextEditingController oldPassword;
  final TextEditingController newPassword =TextEditingController();
  final TextEditingController confirmPassword =TextEditingController();
  

  ChangePassword({Key? key, required this.user})
      : oldPassword = TextEditingController(text: user.first_name),
       
        super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: const Text("Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
             

            Stack(
              children: [
                Container(
                margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: InputField(
                  isPassword: true,
                    label: "Old Password",
                    controller: oldPassword,
                    validator: Validator.password),
              ), 
              Positioned(
                right: 40.0,top: 20.0,
                child: GestureDetector(child: Icon(Icons.remove_red_eye),))],
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: InputField(
                                isPassword: true,

                  label: "New Password",
                  controller: newPassword,
                  validator: Validator.password),
            ),
              Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: InputField(
                                isPassword: true,

                  label: "Confirm Password",
                  controller: confirmPassword,
                  validator: Validator.password),
            ),
SizedBox(height: 30,),
             Container(
              margin: EdgeInsets.only(left: 20),
               child: Row(
                           children: [ GestureDetector(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                   borderRadius: BorderRadius.all(Radius.circular(15)
                   ),
                   ),
                   child: Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                   )
                           ),
                           SizedBox(width:150),
                           GestureDetector(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green),
                   borderRadius: BorderRadius.all(Radius.circular(15)
                   ),
                   ),
                   child: Text("Cancel", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),),
                   )
                           )
                           ]
                           ),
             )
          ]),
        ));
  }
}
