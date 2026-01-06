import 'dart:async';

import 'package:appcrew/controller/auth_controller.dart';
import 'package:appcrew/model/note_model.dart';
import 'package:appcrew/repository/notes_repository.dart';
import 'package:get/get.dart';



class NotesController extends GetxController {
  final repo = NotesRepositoryImpl();
  final auth = Get.find<AuthController>();

  RxList<NoteModel> notes = <NoteModel>[].obs;
  RxString searchQuery = ''.obs;

  StreamSubscription? _notesSub;

  @override
  void onInit() {
    super.onInit();
    ever(auth.user, _handleAuthChanged);
  }

  void _handleAuthChanged(user) {
    _notesSub?.cancel();

    if (user != null) {
      _notesSub = repo
          .getNotes(user.uid)
          .listen(
            (data) {
              notes.value = data;
            },
            onError: (e) {
              Get.snackbar('Error', e.toString());
            },
          );
    } else {
      notes.clear();
    }
  }

  List<NoteModel> get filteredNotes {
    if (searchQuery.value.isEmpty) return notes;
    return notes
        .where(
          (n) =>
              n.title.toLowerCase().contains(searchQuery.value.toLowerCase()),
        )
        .toList();
  }

  Future<void> addNote(String title, String content) async {
    final note = NoteModel(
      id: '',
      title: title,
      content: content,
      userId: auth.user.value!.uid,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await repo.addNote(note);
  }

  Future<void> updateNote(String id, String title, String content) async {
    final note = NoteModel(
      id: id,
      title: title,
      content: content,
      userId: auth.user.value!.uid,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repo.updateNote(note);
  }

  Future<void> deleteNote(String id) async {
    await repo.deleteNote(id);
  }

  @override
  void onClose() {
    _notesSub?.cancel();
    super.onClose();
  }
}
