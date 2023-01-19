// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add-note_bottem_sheet.dart';
import 'package:note_app/views/widgets/notes_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              context: context,
              builder: (context) {
                return const AddNodeBottemSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: NotesViewBody(
        color: const Color(0xffFFCD79),
      ),
    );
  }
}
