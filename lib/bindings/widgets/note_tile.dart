import 'package:appcrew/controller/notes_controller.dart';
import 'package:appcrew/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../routes/app_routes.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;
  NoteTile({super.key, required this.note});

  final controller = Get.find<NotesController>();
  final dateFormat = DateFormat('dd MMM yyyy, hh:mm a');

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: Border.all(color: Colors.grey),
      elevation: 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(
          note.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
            Text(
              'Created: ${dateFormat.format(note.createdAt)}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              'Updated: ${dateFormat.format(note.updatedAt)}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),

        onTap: () => Get.toNamed(Routes.addEditNote, arguments: note),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Get.toNamed(Routes.addEditNote, arguments: note);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await controller.deleteNote(note.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
