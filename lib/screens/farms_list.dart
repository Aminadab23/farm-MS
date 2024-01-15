import 'package:flutter/material.dart';

import '../components/drawer.dart';

class FarmsListData {
  final String imageUrl;
  final String locationName;
  final String status;
  final Icon icon;

  FarmsListData({
    required this.imageUrl,
    required this.locationName,
    required this.status,
    required this.icon,
  });
}

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
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual data fetching logic
    setState(() {
      farmData = [
        FarmsListData(
          imageUrl: 'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          locationName: 'Debrezeyit Agricultural Research Center',
          status: 'Active',
          icon: Icon(Icons.check_circle),
        ),
        FarmsListData(
          imageUrl: 'https://imgs.search.brave.com/9fYnssXx5Kaqjn8SmfFsxq-kEAcHuerTe6ZpTvrCMJE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9o/aWdoLWFuZ2xlLWZh/cm1sYW5kLXZpZXdf/MjMtMjE0ODU3OTY4/MC5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
          locationName: 'Woliso Flower Farm',
          status: 'Inactive',
          icon: Icon(Icons.close_rounded),
        ),
        // Add more data items as needed
      ];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farm MS"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Handle notifications button press
                },
              ),
              Positioned(
                top: 8.0,
                right: 6.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    '3', // Replace with your actual notification count
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: const CircleAvatar(),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
         Expanded(
              child: ListView.builder(
                itemCount: farmData.length,
                itemBuilder: (context, index) {
                  FarmsListData data = farmData[index];
                  return ListTile(
                    leading: Container(height: 100, width: 100, child: Image.network(data.imageUrl),),
                    title: Text(data.locationName),
                    subtitle: Row(
                      children: [
                        data.icon,
                        Text(data.status),
                      ],
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