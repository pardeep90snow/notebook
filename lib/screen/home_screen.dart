import 'package:appcrew/bindings/widgets/note_tile.dart';
import 'package:appcrew/controller/auth_controller.dart';
import 'package:appcrew/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class NotesListPage extends StatelessWidget {
  NotesListPage({super.key});

  final controller = Get.find<NotesController>();
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('My Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await auth.logout();
              Get.offAllNamed(Routes.login);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addEditNote),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Search notes...',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) => controller.searchQuery.value = value,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.filteredNotes.isEmpty) {
                  return const Center(child: Text('No notes found'));
                }
                return ListView.builder(
                  itemCount: controller.filteredNotes.length,
                  itemBuilder: (context, index) {
                    return NoteTile(note: controller.filteredNotes[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
