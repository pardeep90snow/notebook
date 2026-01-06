import 'package:appcrew/model/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesRepositoryImpl {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<NoteModel>> getNotes(String userId) {
    return _firestore
        .collection('notes')
        .where('user_id', isEqualTo: userId)
        .orderBy('updated_at', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((e) => NoteModel.fromJson(e.data(), e.id))
              .toList(),
        );
  }

  Future<void> addNote(NoteModel note) async {
    await _firestore.collection('notes').add({
      'title': note.title,
      'content': note.content,
      'user_id': note.userId,
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateNote(NoteModel note) async {
    await _firestore.collection('notes').doc(note.id).update({
      'title': note.title,
      'content': note.content,
      'updated_at': FieldValue.serverTimestamp(),
    });
  }


  Future<void> deleteNote(String id) async {
    await _firestore.collection('notes').doc(id).delete();
  }
}
