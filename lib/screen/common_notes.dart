import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/notes_controller.dart';
import '../model/note_model.dart';

class AddEditNotePage extends StatelessWidget {
  AddEditNotePage({super.key});

  final controller = Get.find<NotesController>();
  final titleCtrl = TextEditingController();
  final contentCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteModel? note = Get.arguments;

    if (note != null) {
      titleCtrl.text = note.title;
      contentCtrl.text = note.content;
    }

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          if (note == null) {
            await controller.addNote(
              titleCtrl.text.trim(),
              contentCtrl.text.trim(),
            );
          } else {
            await controller.updateNote(
              note.id,
              titleCtrl.text.trim(),
              contentCtrl.text.trim(),
            );
          }
          Get.back();
        },
        child: Container(
          alignment: .center,
          width: Get.width,
          height: 40,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: .circular(12),
          ),
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontWeight: .w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contentCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Content',
              ),
              maxLines: 5,
            ),
            if (note != null) ...[
              const SizedBox(height: 12),
              Text(
                'Last updated: ${DateFormat('dd MMM yyyy, hh:mm a').format(note.updatedAt)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
