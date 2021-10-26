part of 'login_bloc.dart';

class LoginEvent {
  final String userName;
  final String userEmail;
  final bool loggedIn;
  final DateTime timestamp;

  LoginEvent(
      {required this.userName,
      required this.userEmail,
      required this.loggedIn,
      DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}
