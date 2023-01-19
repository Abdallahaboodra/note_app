part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLodaing extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFaulier extends AddNoteState {
  final String errorMessage;

  AddNoteFaulier(this.errorMessage);
}
