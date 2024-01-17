import 'package:farms/components/appbar.dart';
import 'package:farms/components/drawer.dart';
import 'package:farms/models/notes_model.dart';
import 'package:farms/screens/notes_detail.dart';
import 'package:farms/screens/notes_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<NoteModel> items = [
    NoteModel(
        title: "Do the first thing",
        description:
            "the first thing is to complete the ui of the whole project.",
        date: "Jan 16,2024"),
    NoteModel(
        title: "Do the second thing",
        description: "the second thing is to complete the backend preparation.",
        date: "Jan 16,2024"),
    NoteModel(
        title: "Do the third thing",
        description:
            "the third thing is to complete the merging of all features from git.",
        date: "Jan 16,2024"),
    NoteModel(
        title: "Do the fourth thing",
        description:
            "the fourth thing is to complete the backend integration and feeding data to it..",
        date: "Jan 16,2024"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount:
              items.length, // Replace with the actual number of items you have
          itemBuilder: (context, index) {
            NoteModel item = items[index];
            return GestureDetector(
              onTap: () {
                Get.to(NoteDetail(
                  note: item,
                ));
              },
              child: Card(
                  child: Column(children: [
                Center(
                    child: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.description)),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.centerRight,
                    child: Text(item.date))
              ])),
            );
          },
        ),
      ),
    );
  }
}

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                    "Notes",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                const SizedBox(width: 150),
                GestureDetector(
                  onTap: () {
                    Get.to(const AddNote());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Text(
                        "Add Notes",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
            const Expanded(child: NotesList()),
          ],
        ),
      ),
    );
  }
}
