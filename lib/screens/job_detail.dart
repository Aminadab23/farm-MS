import 'package:farms/components/appbar.dart';
import "../models/jobs_model.dart";
import 'package:flutter/material.dart';
import '../components/drawer.dart';

class JobDetail extends StatelessWidget {
  final JobsModel? jobs;
  const JobDetail({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: MyDrawer(),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(height: 40),
             
                       Text(jobs!.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)), Text(jobs!.farm,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Row(children: [
                const Icon(
                  Icons.stacked_line_chart_sharp,
                  color: Colors.orange,
                ),
                Text(jobs!.status)
              ]),
              // Column(children: [
              //   Text("Assigned Workers", style: TextStyle(fontWeight:FontWeight.bold)),
              //   // Expanded(
              //   //   child: ListView.builder(
              //   //     itemCount: jobs!.workers
              //   //         .length, // Change this to the number of items you want in the list
              //   //     itemBuilder: (context, index) {
              //   //       final worker = jobs!.workers[index];
              //   //       return ListTile(
              //   //         title: Text(' $worker'),
              //   //       );
              //   //     },
              //   //   ),
              //   // )
              // ]),
              Container(
                child: Stack(
                        children: [
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            minHeight: 24.0,
                            value: double.parse(jobs!.progress_percent)/100,
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
                                '${jobs!.progress_percent}%', // Replace with the actual percentage
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
              const SizedBox(height: 30),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.network(jobs!.imageUrl))
            ])));
  }
}
