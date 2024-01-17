import 'package:farms/components/appbar.dart';
import 'package:farms/screens/harverst_detail.dart';
import 'package:farms/screens/harvest_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

import '../components/drawer.dart';
import "../models/harvest_model.dart";

class HarvestList extends StatefulWidget {
  const HarvestList({Key? key}) : super(key: key);

  @override
  State<HarvestList> createState() => _HarvestListState();
}

class _HarvestListState extends State<HarvestList> {
  late List<HarvestModel> farmData = [];
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Simulate fetching data from an API or other source
    await Future.delayed(const  Duration(seconds: 2));

    // Replace this with your actual data fetching logic
    setState(() {
      farmData = [
        HarvestModel(
          imageUrl:
              'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          name: 'Teff',
          
          type: "Cerial",
          farm: "Debrezeyit Agricultural Farm",
          createdAt: "Jan 4, 2024",
          updatedAt: "Jan 4, 2024",
          date_to_harvest: "Jul 23, 2024",
          quantity: "1.38ton/hec",
          quality: "medium",
        ),
        HarvestModel(
          imageUrl:
              'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          name: 'Maze',
          
          type: "Cerial",
          farm: "Woliso Agricultural Farm",
          createdAt: "Jan 24, 2024",
          updatedAt: "Jan 24, 2024",
          date_to_harvest: "Aug 23, 2024",
          quantity: "3.38ton/hec",
          quality: "Good",
        ),
        // Add more data items as needed
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: CustomAppBar(),

      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: const  Icon(Icons.search),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Harvests",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                const SizedBox(width: 150),
                GestureDetector(
                  onTap: () {
                    Get.to(const HarvestForm());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Text(
                        "Add Harvests",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: farmData.length,
                itemBuilder: (context, index) {
                  HarvestModel data = farmData[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(HarvestDetail(farm: data));
                    },
                    child: ListTile(
                      leading: Container(
                        height: 100,
                        width: 100,
                        child: Image.network(data.imageUrl),
                      ),
                      title: Text(data.name),
                      subtitle: Row(
                        children: [
                          Icon(Mdi.chartBar),
                          Text(data.quantity),
                        ],
                        
                      ),
                      trailing: Text(data.date_to_harvest),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
