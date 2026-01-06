# appcrew

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

Project Setup

Clone the repository

Create a Firebase project

Add google-services.json to android/app

Enable Email/Password Authentication and Cloud Firestore

Run flutter pub get

Run App Locally
flutter run

Database Schema

Collection: notes
Fields:

title (String)

content (String)

user_id (String)

created_at (Timestamp)

updated_at (Timestamp)

Authentication

Firebase Email/Password Authentication

Session persists automatically using FirebaseAuth

Logged-in users are redirected to the home screen on app restart

Assumptions / Trade-offs

No local caching for offline mode

UI kept minimal and functional

Firebase used as the only backend service


Setup Instructions

Clone the repository and install dependencies using flutter pub get

Configure Firebase by adding google-services.json

Enable Firebase Authentication (Email/Password) and Cloud Firestore

Running the Application

Use flutter run to run the app on an emulator or device

Generate APK using flutter build apk --release

Database Structure

Firestore collection notes storing user-specific notes

Each note contains title, content, user ID, and timestamps

Authentication

Firebase Authentication with email and password

Authentication state is preserved across app restarts

Navigation handled using GetX based on auth state

Design Decisions

Offline handling without local persistence to keep implementation simple

Focus on clean architecture and stable functionality over advanced UI


