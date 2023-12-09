import 'package:flutter/material.dart';
import 'package:flutternotes/models/notes_model.dart';
import 'package:flutternotes/note_view.dart';

class NoteCard extends StatelessWidget {

  const NoteCard({super.key, required this.note, required this.index, required this.NoteDelete});

  final Note note;
  final int index;

  final Function(int)NoteDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: note, index: index,NoteDelete: NoteDelete,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  note.body,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ]
          ),
        ),
      ),
    );
  }
}
