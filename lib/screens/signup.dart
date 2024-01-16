import 'package:farms/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputfields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar("Error", "password not match.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 5));
      } else {
        Get.to( () => const Login(),
  arguments: {
    "email": emailController.text,
    "password": passwordController.text,
  },);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
            height: 200,
            child:  Center(
        child: Container(
          width: double.infinity,
        height: 200.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 155, 14), 
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(1000.0), 
          ),
        
         ),
      
        ))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: const Center(child: Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),)),),
                  InputField(
                    label: 'First Name',
                    controller: firstNameController,
                    validator: Validator.name,
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    label: 'Last Name',
                    controller: lastNameController,
                    validator: Validator.name,
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    label: 'Email',
                    controller: emailController,
                    validator: Validator.email,
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    label: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    validator: Validator.password,
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    isPassword: true,
                    validator: Validator.password,
                  ),
                  const SizedBox(height: 22.0),
                  InkWell(
                    onTap: _handleSignUp,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 14, 221,59),
                        borderRadius: BorderRadius.circular(10.0),
                        // border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 250, 248, 248), // Use provided textColor or default to white
                        ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Center(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have account?", style: TextStyle(fontSize: 18.0),),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.to(const Login());
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Color.fromARGB(255, 14, 221,59),fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
