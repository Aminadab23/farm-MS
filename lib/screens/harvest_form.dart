
import 'package:farms/components/drawer.dart';
import 'package:farms/screens/harvest_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../components/inputfields.dart';

class HarvestForm extends StatefulWidget {
  const HarvestForm({Key? key}) : super(key: key);

  @override
  State<HarvestForm> createState() => _HarvestFormState();
}

class _HarvestFormState extends State<HarvestForm> {
  final TextEditingController farmName = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController cropName = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedFarm = 'Farm 1';

  List<String> farmTypes = ['Farm 1', 'Farm 2', 'Farm 3'];

  List<String> cropTypes = [
    'Type 1',
    'Type 2',
    'Type 3'
  ]; // Replace with your actual crop types
  String selectedCropType = 'Type 1';

  List<String> qualities = [
    'Quality 1',
    'Quality 2',
    'Quality 3'
  ]; // Replace with your actual qualities
  String selectedQuality = 'Quality 1';

  DateTime? selectedDate;

  void _handleHarvestForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form data, including the selected image and location.
      // You can use _pickedImage, selectedCropType, selectedQuality, selectedDate, etc. variables here.

      Get.to(() => const HarvestList());
      Get.snackbar("Success", "Added Harvest Successfully",
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
                          "Add Harvest",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        )),
                      ),
                      Row(children: [
                        DropdownButton<String>(
                          value: selectedFarm,
                          onChanged: (String? value) {
                            setState(() {
                              selectedFarm = value!;
                            });
                          },
                          items: farmTypes.map((String farmType) {
                            return DropdownMenuItem<String>(
                              value: farmType,
                              child: Text(farmType),
                            );
                          }).toList(),
                          hint: const Text('Select Farm '),
                        ),
                        SizedBox(width: 50),
                        DropdownButton<String>(
                          value: selectedCropType,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCropType = value!;
                            });
                          },
                          items: cropTypes.map((String cropType) {
                            return DropdownMenuItem<String>(
                              value: cropType,
                              child: Text(cropType),
                            );
                          }).toList(),
                          hint: const Text('Select Crop Type'),
                        ),
                      ]),
                      const SizedBox(height: 10.0),
                      InputField(
                        label: 'Crop Name',
                        controller: cropName,
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 10.0),
                      InputField(
                        label: 'Quantity',
                        controller: quantity,
                        validator: Validator.name,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedQuality,
                            onChanged: (String? value) {
                              setState(() {
                                selectedQuality = value!;
                              });
                            },
                            items: qualities.map((String quality) {
                              return DropdownMenuItem<String>(
                                value: quality,
                                child: Text(quality),
                              );
                            }).toList(),
                            hint: const Text('Select Quality'),
                          ),
                          const SizedBox(width: 22.0),
                          InkWell(
                            onTap: () async {
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year + 1),
                              );
                              if (pickedDate != null &&
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  selectedDate != null
                                      ? 'Harvest Date: ${selectedDate!.day}, ${selectedDate!.month} , ${selectedDate!.year}'
                                      : 'Select Harvest Date',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22.0),
                      InkWell(
                        onTap: _handleHarvestForm,
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
