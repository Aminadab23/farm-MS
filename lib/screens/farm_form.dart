import 'dart:io';

import 'package:farms/components/drawer.dart';
import 'package:farms/screens/farms_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import '../components/appbar.dart';
import '../components/inputfields.dart';

class FarmForm extends StatefulWidget {
  const FarmForm({Key? key}) : super(key: key);

  @override
  State<FarmForm> createState() => _FarmFormState();
}

class _FarmFormState extends State<FarmForm> {
  final TextEditingController farmName = TextEditingController();
  final TextEditingController farmLocation = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController area = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _pickedImage;

  String _selectedLocation = 'Select Location'; // Default text

  final Location _location = Location();

  Future<void> _pickLocation() async {
    try {
      LocationData locationData = await _location.getLocation();
      setState(() {
        _selectedLocation =
            'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}';
      });
    } catch (e) {
      print('Error picking location: $e');
    }
  }

  Future _getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => _pickedImage = imageTemp);
    } catch (e) {
      Get.snackbar("error", "permission error $e");
    }
  }

  void _handleFarmForm() {
    if (_formKey.currentState!.validate()) {
      Get.to(() => const FarmLists());
      Get.snackbar("Success", "Added Farm Successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.black),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        child: const Center(
                            child: Text(
                          "Add Farm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        )),
                      ),
                      InputField(
                        label: 'Farm Name',
                        controller: farmName,
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 10.0),
                     
                      const SizedBox(height: 10.0),
                      InputField(
                        label: 'Status',
                        controller: status,
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 10.0),
                      InputField(
                        label: 'Area',
                        controller: area,
                        isPassword: true,
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: _getImage,
                        child: _pickedImage != null
                          ? Image.file(_pickedImage!, width: 50, height: 50,fit: BoxFit.cover,)
                          : const Text("Select Image"),
                      ),
                      
                      const SizedBox(height: 10.0),
                      Text("Farm Location"),
                      InkWell(
                        onTap: _pickLocation,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              _selectedLocation ?? 'Pick Location',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      InkWell(
                        onTap: _handleFarmForm,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 14, 221, 59),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Color.fromARGB(255, 250, 248, 248),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
