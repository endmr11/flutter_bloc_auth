import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_login_example/helpers/auth_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  String? userName;
  String? userEmail;
  bool? loggedIn;

  @override
  //Etkinliğin gerçekleştirilmesi
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    LoginState newState;
    userName = event.userName;
    userEmail = event.userEmail;
    loggedIn = event.loggedIn;
    newState = LoginState(userName!, userEmail!, loggedIn!);
    yield newState;
  }

  void saveLoginUser(String userName, String userEmail) {
    AuthHelper.saveUserNameSharedPreference(userName);
    AuthHelper.saveUserEmailSharedPreference(userEmail);
    AuthHelper.saveUserLoggedInSharedPreference(true);
    // ignore: avoid_print
    print("Kullanıcı Giriş Yaptı");
    add(LoginEvent(
      userName: userName,
      userEmail: userEmail,
      loggedIn: true,
    ));
  }

  void setLoginUser(String userName, String userEmail) {
    // ignore: avoid_print
    print("Kullanıcı Uygulamayı Yeniden Açtı");
    add(LoginEvent(
      userName: userName,
      userEmail: userEmail,
      loggedIn: true,
    ));
  }
}
