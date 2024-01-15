import 'package:farms/components/appbar.dart';
import 'package:farms/screens/farms_list.dart';
import 'package:flutter/material.dart';
import '../components/drawer.dart';
class FarmDetail extends StatelessWidget {
  final FarmsListData farm;
  const FarmDetail({super.key, required this.farm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: CustomAppBar(),

      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(farm.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           Row(children:[
           Icon(Icons.location_on), Text(farm.locationName)
          ]),
          Row(children:[
            farm.icon, Text(farm.status)
          ]),
          Row(children:[
            const Icon(Icons.area_chart), Text(farm.area.toString()),Text(" sq KM")
          ]),
          SizedBox(height: 30),
          Image.network(farm.imageUrl)
          
          ])));
  }
}
