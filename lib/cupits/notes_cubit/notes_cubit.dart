// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';

import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
