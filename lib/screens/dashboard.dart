import 'package:farms/screens/farms_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/charts.dart';
import '../components/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<double> graphData = [20.0, 50.0, 30.0, 70.0, 45.0];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Add the listener for tab changes here
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // The index is changing, you can handle additional actions if needed
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
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
                  child: const CircleAvatar()),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              _buildTab("Farm"),
              _buildTab("Jobs"),
              _buildTab("Harvest"),
            ],
            indicator: BoxDecoration(
              color: const Color.fromARGB(255, 14, 221, 59),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Content for Farm tab
            GestureDetector(
              onTap: () {
                // Navigate to the detail screen for the selected item in the "Farm" tab
                Get.to(const FarmLists());
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    const Text("Farm 1",
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: const Stack(
                        children: [
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            minHeight: 24.0,
                            value: 0.3,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            color: Colors.green,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                '30%', // Replace with the actual percentage
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    const Text("Farm 2",
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: const Stack(
                        children: [
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            minHeight: 24.0,
                            value: 0.8,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            color: Color.fromARGB(255, 238, 111, 26),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                '80%', // Replace with the actual percentage
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Farm 3",
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: const Stack(
                        children: [
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            minHeight: 24.0,
                            value: 0.6,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            color: Colors.green,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                '60%', // Replace with the actual percentage
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(
                      height: 300,
                      child: MyBarGraph(farmsSummery: graphData,),
                    )
                  ],
                ),
              ),
            ),

            // Content for Jobs tab
            Container(
              child: Column(
                children: [
                  const Text("Jobs", style: TextStyle(color: Colors.green)),
                  Image.network(""),
                ],
              ),
            ),

            // Content for Harvest tab
            Container(
              child: Column(
                children: [
                  const Text("Harvest", style: TextStyle(color: Colors.green)),
                  Image.network(""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: const Color.fromARGB(255, 41, 224, 111)),
      ),
      child: Tab(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Color.fromARGB(255, 41, 224, 111),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black, // Active tab text color
            ),
          ),
        ),
      ),
    );
  }
}
