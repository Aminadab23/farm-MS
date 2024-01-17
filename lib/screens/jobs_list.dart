import 'package:farms/components/appbar.dart';
import 'package:farms/models/jobs_model.dart';
import 'package:farms/screens/farm_detail.dart';
import 'package:farms/screens/farm_form.dart';
import 'package:farms/screens/job_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "../models/farm_model.dart";
import '../components/drawer.dart';

class JobsList extends StatefulWidget {
  const JobsList({Key? key}) : super(key: key);

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
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
                    "Jobs",
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
                        "Add Job",
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
  late List<JobsModel> farmData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<JobsModel>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));


    farmData = [
      JobsModel(
        imageUrl:
            'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
        title: 'Planting',
farm: "Woliso Flower Farm",

        status: 'Active',
        progress_percent: "50",
        workers: ["Worker 1", "Worker 2"],
date: "Jan 16, 2024"
        
      ),
      JobsModel(
        imageUrl:
            'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
        title: 'Harvesting',
farm: "Debrezeyit Agricultural Research center",
        status: 'Done',
        progress_percent: "100",
        workers: ["Worker 3", "Worker 4", "Worker 5"],
date: "Jan 16, 2024"
        
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
          List<JobsModel>? items = snapshot.data;
          return ListView.builder(
            itemCount: items?.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items?[index];
              return GestureDetector(
                onTap: () {
                   Get.to(JobDetail(jobs: item));
                },
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 63, 63, 63).withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), 
      ),
    ],
    color:Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 100,
                  child: ListTile(
                    title: Text(item!.title),
                    subtitle: Text(item!.status),
                    trailing: Text(item!.date),
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
