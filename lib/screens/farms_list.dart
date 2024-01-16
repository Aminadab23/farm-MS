import 'package:farms/components/appbar.dart';
import 'package:farms/screens/farm_detail.dart';
import 'package:farms/screens/farm_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "../models/farm_model.dart";
import '../components/drawer.dart';

class FarmLists extends StatefulWidget {
  const FarmLists({Key? key}) : super(key: key);

  @override
  State<FarmLists> createState() => _FarmListsState();
}

class _FarmListsState extends State<FarmLists> {
  late List<FarmsListData> farmData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Simulate fetching data from an API or other source
    await Future.delayed(const Duration(seconds: 2));

    // Replace this with your actual data fetching logic
    setState(() {
      farmData = [
        FarmsListData(
          imageUrl:
              'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          name: 'Debrezeyit Agricultural Research Center',
          locationName: "Bishoftu, Oromia,Ethiopia",
          status: 'Active',
          icon: const Icon(Icons.check_circle),
          area: 30000,
        ),
        FarmsListData(
          imageUrl:
              'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          name: 'Woliso Flower Farm',
          locationName: "Woliso,Shewa, Ethiopia",
          status: 'Inactive',
          icon: const Icon(Icons.close_rounded),
          area: 20000,
        ),
        // Add more data items as needed
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: const CustomAppBar(),

      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Farms",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                const SizedBox(width: 180),
                GestureDetector(
                  onTap: () {
                    Get.to(const FarmForm());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Text(
                        "Add Farm",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: farmData.length,
                itemBuilder: (context, index) {
                  FarmsListData data = farmData[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(FarmDetail(farm: data));
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
                          data.icon,
                          Text(data.status),
                        ],
                      ),
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
