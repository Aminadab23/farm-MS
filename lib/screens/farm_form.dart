import 'dart:io';

import 'package:farms/components/drawer.dart';
import 'package:farms/screens/farms_list.dart';
import 'package:farms/screens/login.dart';
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
  final ImagePicker _imagePicker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? _pickedImage;

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

  Future<void> _getImage() async {
  final permissionStatus = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (permissionStatus != null) {
    final pickedImage = permissionStatus;
    setState(() {
      _pickedImage = pickedImage;
    });
  }
}

  void _handleFarmForm() {
    if (_formKey.currentState!.validate()) {
      Get.to(() => FarmLists());
      Get.snackbar("Success", "Added Farm Successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.black),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        child: Center(
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
                      SizedBox(height: 10.0),
                      InputField(
                        label: 'Farm Location',
                        controller: farmLocation,
                        validator: Validator.name,
                      ),
                      SizedBox(height: 10.0),
                      InputField(
                        label: 'Status',
                        controller: status,
                        validator: Validator.name,
                      ),
                      SizedBox(height: 10.0),
                      InputField(
                        label: 'Area',
                        controller: area,
                        isPassword: true,
                        validator: Validator.name,
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: _getImage,
                        child: Text("Select Image"),
                      ),
                      _pickedImage != null
                          ? Image.file(File(_pickedImage!.path))
                          : Text("No Image Selected"),
                      SizedBox(height: 10.0),
                      InkWell(
                        onTap: _pickLocation,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              _selectedLocation ?? 'Pick Location',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.0),
                      InkWell(
                        onTap: _handleFarmForm,
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 14, 221, 59),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(12.0),
                          child: Center(
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
                      SizedBox(height: 15),
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
