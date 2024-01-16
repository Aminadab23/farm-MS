import 'package:farms/components/appbar.dart';
import 'package:farms/components/drawer.dart';
import 'package:farms/screens/harvest_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<int> items = [
    1,
    2,
    3,
    4,
    5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount:
              items.length, // Replace with the actual number of items you have
          itemBuilder: (context, index) {
            // Replace the following widget with your custom item widget
            return Card(
              child: ListTile(
                title: Text("Items ${items[index]}"),
                subtitle: Text("lorem eipsum eiorium lorem eipsum eioriumlorem eipsum eioriumlorem eipsum eiorium "),
               
              ),
            );
          },
        ),
      ),
    );
  }
}
