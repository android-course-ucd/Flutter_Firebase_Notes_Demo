import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_demo/note_creator.dart';

import 'models/note.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<Note> _notes = [
    Note(title: "Hello", content: "My first note"),
    Note(title: "Another Note", content: "Hello again"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, i) => _buildItem(_notes[i])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteCreator(
                onCreateNote: (note) => setState(
                      () => _notes.add(note),
                    )),
          ),
        ),
      ),
    );
  }

  static Widget _buildItem(Note note) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(note.content),
          ],
        ),
      ),
    );
  }
}
