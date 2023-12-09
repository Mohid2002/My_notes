import 'package:flutter/material.dart';
import 'package:flutternotes/notes_storage.dart';
import 'package:flutternotes/models/notes_model.dart';
import 'package:flutternotes/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notyee 4 U')),
        backgroundColor: Colors.black54,
      ),

      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context,index){
            return NoteCard(note: notes[index], index: index,NoteDelete: NoteDelete,);
            },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notes(NewNote: NewNote)));
        },
        child: Icon(Icons.add),
      )
    );
  }
  void NewNote(Note note){
    notes.add(note);
    setState(() {});
  }

  void NoteDelete(int index){
    notes.remove(index);
    setState(() {});
  }
}
