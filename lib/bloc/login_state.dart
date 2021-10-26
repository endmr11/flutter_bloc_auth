part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String userName;
  final String userEmail;
  final bool loggedIn;

  const LoginState(this.userName, this.userEmail, this.loggedIn);

  @override
  List<Object> get props => [userName, userEmail, loggedIn];
}
