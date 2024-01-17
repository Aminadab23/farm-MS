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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),
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
            const Expanded(child: Farms()),
          ],
        ),
      ),
    );
  }
}

class Farms extends StatefulWidget {
  const Farms({super.key});

  @override
  State<Farms> createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  late List<FarmsListData> farmData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<FarmsListData>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    // Replace this with your actual data fetching logic

    farmData = [
      FarmsListData(
        imageUrl:
            'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
        name: 'Debrezeyit Agricultural Research Center',
        locationName: "Bishoftu, Oromia,Ethiopia",
        status: 'Active',
        icon: const Icon(Icons.check_circle,color: Colors.orange,),
        area: 30000,
      ),
      FarmsListData(
        imageUrl:
            'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
        name: 'Woliso Flower Farm',
        locationName: "Woliso,Shewa, Ethiopia",
        status: 'Inactive',
        icon: const Icon(Icons.close_rounded,color: Colors.orange,),
        area: 20000,
      ),
      // Add more data items as needed
    ];

    return farmData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<FarmsListData>? items = snapshot.data;
          return ListView.builder(
            itemCount: items?.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items?[index];
              return GestureDetector(
                onTap: () {
                  Get.to(FarmDetail(farm: item));
                },
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 63, 63, 63).withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    color:Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right:7),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Image.network(item!.imageUrl)
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Container(
                            width: 120,
                            child: Text(item!.name)), 
                          const SizedBox(height:5),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              item!.icon, Text(item!.status)
                            ],
                          )
                        ]
                      )
                    ],
                  )
                ),
              );
            },
          );
        }
      },
    ));
  }
}
