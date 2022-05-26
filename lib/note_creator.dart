import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/models/note.dart';

// typedef void OnCreateNoteCallback(Note note);
typedef OnCreateNoteCallback = void Function(Note note);

class NoteCreator extends StatefulWidget {
  final OnCreateNoteCallback onCreateNote;

  const NoteCreator({Key? key, required this.onCreateNote}) : super(key: key);

  @override
  State<NoteCreator> createState() => _NoteCreatorState();
}

class _NoteCreatorState extends State<NoteCreator> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Note")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(hintText: "Content"),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.onCreateNote(Note(
              title: _titleController.text, content: _contentController.text));
          Navigator.pop(context);
        },
        icon: const Icon(Icons.add),
        label: const Text("Create"),
      ),
    );
  }
}
