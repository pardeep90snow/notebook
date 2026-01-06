import 'package:appcrew/screen/home_screen.dart';
import 'package:appcrew/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';


class AuthGate extends GetView<AuthController> {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.value == null) {
        return LoginPage();
      } else {
        return NotesListPage();
      }
    });
  }
}
