import 'package:flutter/material.dart';
import 'package:flutternotes/models/notes_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.index, required this.NoteDelete});

  final Note note;
  final int index;

  final Function(int) NoteDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note view"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Delete This?"),
                      content: Text("Note ${note.title}will be deleted! "),

                      actions: [
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                              NoteDelete(index);
                              Navigator.of(context).pop();
                            },
                            child: Text("DELETE"),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("CANCEL"),
                        ),
                      ],
                    );
                  },
              );
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
               note.title,
               style: const TextStyle(
                 fontSize: 26,
               ),
             ),
            const SizedBox(height: 10),
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
