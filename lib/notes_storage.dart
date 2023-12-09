import 'package:flutter/material.dart';
import 'package:flutternotes/models/notes_model.dart';

class Notes extends StatefulWidget {
  const Notes({super.key, required this.NewNote});

  final Function(Note) NewNote;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('New Note'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(
                fontSize: 28,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),

            SizedBox(height: 18),

            TextFormField(
              controller: bodyController,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Story"
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(titleController.text.isEmpty){
            return;
          }
          if(bodyController.text.isEmpty){
            return;
          }
          final note = Note(
            body: bodyController.text,
            title: titleController.text,
          );

          widget.NewNote(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
