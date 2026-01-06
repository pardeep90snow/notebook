import 'package:appcrew/controller/auth_controller.dart';
import 'package:appcrew/controller/internet_controller.dart';
import 'package:appcrew/controller/notes_controller.dart';
import 'package:get/get.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<NotesController>(NotesController(), permanent: true);
    Get.put<InternetController>(InternetController(), permanent: true);
  }
}
