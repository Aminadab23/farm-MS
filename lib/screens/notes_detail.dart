import 'package:farms/models/notes_model.dart';
import 'package:farms/screens/notes_form.dart';
import 'package:flutter/material.dart';
import 'package:farms/components/appbar.dart';
import 'package:farms/components/drawer.dart';
import 'package:get/get.dart';

class NoteDetail extends StatelessWidget {
  final NoteModel note;
  const NoteDetail({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: MyDrawer(),
        body: Container(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                      width: 240,
                      child: Text(
                        note.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      )),
                  // SizedBox(width: ,)
                  GestureDetector(
                      onTap: () {
                        Get.to(EditNote(
                          note: note,
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Text("Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              child: Text(note.date),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(12),
              child: Text(note.description),
            ),
          ]),
        ));
  }
}
