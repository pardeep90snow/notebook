import 'package:appcrew/screen/common_notes.dart';
import 'package:appcrew/screen/login_page.dart';
import 'package:appcrew/screen/home_screen.dart';
import 'package:appcrew/screen/signup_page.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const notes = '/notes';
  static const addEditNote = '/add-edit-note';
}

class AppRoutes {
  static final pages = [
    //GetPage(name: Routes.initial, page: () => const SplashDecider()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.signup, page: () => SignupPage()),
    GetPage(name: Routes.notes, page: () => NotesListPage()),
    GetPage(name: Routes.addEditNote, page: () => AddEditNotePage()),
  ];
}
