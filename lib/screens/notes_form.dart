import 'package:farms/components/inputfields.dart';
import 'package:farms/models/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:farms/components/appbar.dart';
import 'package:farms/components/drawer.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _title = TextEditingController();
    final TextEditingController _description= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MyDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30,),

            InputField(
              label: "title",
              controller: _title,
              validator: Validator.name,
            ),
const SizedBox(height: 30,),
const Padding(padding: EdgeInsets.only(left: 5), child: Text("Description"),),
TextField(
          controller: _description,
          minLines: 15,
          maxLines: null,
          decoration: InputDecoration(
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // Set your desired border radius
            ),
          ),
        ),
        const SizedBox(height: 30,),

            Row(
            children: [ GestureDetector(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.green,
                 borderRadius: BorderRadius.all(Radius.circular(15)
                 ),
                 ),
                 child: const Text("Add", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                 )
            ),
            const SizedBox(width:150),
            GestureDetector(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                 borderRadius: const BorderRadius.all(Radius.circular(15)
                 ),
                 ),
                 child: const Text("Cancel", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),),
                 )
            )
            ]
            )
          ],
        ),
      ),
    );
  }
}
class EditNote extends StatelessWidget {
  final NoteModel note;
  final TextEditingController _title;
  final TextEditingController _description;

  EditNote({Key? key, required this.note})
      : _title = TextEditingController(text: note.title), _description = TextEditingController(text: note.description),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MyDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30,),

            InputField(
              label: "title",
              controller: _title,
              validator: Validator.name,
            ),
const SizedBox(height: 30,),
TextField(
          controller: _description,
          minLines: 15,
          maxLines: null,
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // Set your desired border radius
            ),
          ),
        ),
        const SizedBox(height: 30,),

            Row(
            children: [ GestureDetector(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.green,
                 borderRadius: BorderRadius.all(Radius.circular(15)
                 ),
                 ),
                 child: const Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                 )
            ),
            const SizedBox(width:150),
            GestureDetector(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                 borderRadius: const BorderRadius.all(Radius.circular(15)
                 ),
                 ),
                 child: const Text("Cancel", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),),
                 )
            )
            ]
            )
          ],
        ),
      ),
    );
  }
}
