import 'package:farms/components/appbar.dart';
import "../models/farm_model.dart";
import 'package:flutter/material.dart';
import '../components/drawer.dart';
class FarmDetail extends StatelessWidget {
  final FarmsListData? farm;
  const FarmDetail({super.key, required this.farm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar:  CustomAppBar(),

      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(farm!.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           Row(children:[
           const Icon(Icons.location_on, color: Colors.orange,), Text(farm!.locationName)
          ]),
          Row(children:[
            farm!.icon, Text(farm!.status)
          ]),
          Row(children:[
            const Icon(Icons.area_chart, color: Colors.orange,), Text(farm!.area.toString()),const Text(" sq KM")
          ]),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Image.network(farm!.imageUrl))
          
          ])));
  }
}
