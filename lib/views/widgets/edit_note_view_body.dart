import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app/cupits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'package:note_app/views/widgets/custom_appbar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

import 'edit_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, supTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onTap: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.supTitle = supTitle ?? widget.note.supTitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          text: 'Edit Note',
          icon: Icons.check,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextFiled(
          hint: widget.note.title,
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFiled(
          hint: widget.note.supTitle,
          onChanged: (value) {
            supTitle = value;
          },
          maxLines: 5,
        ),
        const SizedBox(
          height: 16,
        ),
        EditNoteColorsList(
          note: widget.note,
        ),
      ],
    );
  }
}
