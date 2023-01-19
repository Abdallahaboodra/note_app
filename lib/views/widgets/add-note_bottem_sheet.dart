// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cupits/notes_cubit/notes_cubit.dart';

import '../../cupits/add_note_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

class AddNodeBottemSheet extends StatelessWidget {
  const AddNodeBottemSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFaulier) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            // ignore: sort_child_properties_last
            child: const SingleChildScrollView(child: AddNoteForm()),
            absorbing: state is AddNoteLodaing ? true : false,
          );
        },
      ),
    );
  }
}
