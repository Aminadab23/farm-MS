import 'package:farms/components/appbar.dart';
import 'package:mdi/mdi.dart';
import "../models/harvest_model.dart";
import 'package:flutter/material.dart';
import '../components/drawer.dart';
class HarvestDetail extends StatelessWidget {
  final HarvestModel farm;
  const HarvestDetail({super.key, required this.farm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: const CustomAppBar(),

      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(farm.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           Row(children:[
           const Text("Crop Type: ", style: TextStyle(fontWeight: FontWeight.bold),), Text(farm.type)
          ]),
          Row(children:[
            const Icon(Mdi.calendarAlert), Text(farm.date_to_harvest)
          ]),
          Row(children:[
            const Icon(Mdi.chartBar), Text(farm.quantity)
          ]),
          Row(children:[
            const Icon(Mdi.information), Text(farm.quality)
          ]),
          
          const SizedBox(height: 30),
          Image.network(farm.imageUrl)
          
          ])));
  }
}
