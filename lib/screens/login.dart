import 'package:farms/screens/dashboard.dart';
import 'package:farms/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/buttons.dart';
import '../components/inputfields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Get.to(() => {const Dashboard()});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Center(
        child: Container(
          width: double.infinity,
        height: 200.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 155, 14), 
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(1000.0), 
          ),
        
         ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: const Center(child: Text("Login", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 46),)),),
                InputField(
                  label: 'Email',
                  controller: emailController,
                  validator: Validator.name,
                ),
                const SizedBox(height: 16.0),
                InputField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  validator: Validator.name,
                ),
                const SizedBox(height: 32.0),
                GestureDetector(
                  onTap: (){
                       Get.to(const Dashboard());
                  },
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 221,
                          59), 
                      borderRadius: BorderRadius.circular(10.0),
                      // border: Border.all(color: Colors.black), // Add a border
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 250, 248, 248), // Use provided textColor or default to white
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have Account?", style: TextStyle(fontSize: 18.0),),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SignUp());
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(color: Color.fromARGB(255, 14, 221,59),fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
               const Center(
                  child: Text(
                    "Or",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  height: 50,
                  width: 50,
                  child: Image.network(
                      "https://imgs.search.brave.com/RcfrjLHnsNTGPLe4i6nhIGpgqXGCWrKWRGS2zDqh0dM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4x/Lmljb25maW5kZXIu/Y29tL2RhdGEvaWNv/bnMvZ29vZ2xlLXMt/bG9nby8xNTAvR29v/Z2xlX0ljb25zLTA5/LTEyOC5wbmc"),
                ),
                const SizedBox(width: 40,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  height: 50,
                  width: 50,
                  child: Image.network(
                      "https://imgs.search.brave.com/_a_AQEhWZcjlsHTQUByLwErNFXuhwxqYwYi7BTMSZ_c/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3Jvd2RzcHJp/bmcuY29tL2Jsb2cv/d3AtY29udGVudC91/cGxvYWRzLzIwMjIv/MDgvMTgxMzEzMDQv/YXBwbGVfbG9nb19i/bGFjay5zdmdfLnBu/Zw"),
                )])
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
