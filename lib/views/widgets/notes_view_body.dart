import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/cupits/notes_cubit/notes_cubit.dart';

import 'custom_appbar.dart';
import 'notes_list_view.dart';

// ignore: must_be_immutable
class NotesViewBody extends StatefulWidget {
  NotesViewBody({super.key, required this.color});
  Color color;

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onTap: () {},
          text: 'Note',
          icon: Icons.search,
        ),
        const Expanded(child: NotesListView()),
      ],
    );
  }
}
