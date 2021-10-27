import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_example/bloc/login_bloc.dart';
import 'package:flutter_login_example/helpers/auth_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  getUserInfo() async {
    String userName = await AuthHelper.getUserNameSharedPreference();
    String userEmail = await AuthHelper.getUserEmailSharedPreference();
    BlocProvider.of<LoginBloc>(context).setLoginUser(userName, userEmail);
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    getUserInfo();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      debugPrint(" AppLifecycleState = Durdu (Home Page)");
    }
    if (state == AppLifecycleState.resumed) {
      getUserInfo();
      debugPrint(" AppLifecycleState = Devam Ediyor (Home Page)");
    }
    if (state == AppLifecycleState.inactive) {
      debugPrint(" AppLifecycleState = İnaktif (Home Page)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anasayfa",
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthHelper.deleteSharedPreference();
              Navigator.pushReplacementNamed(context, "/loginPage");
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: BlocProvider.of<LoginBloc>(context),
          builder: (context, LoginState state) {
            return Column(
              children: [
                Text("Kullanıcı Adı: ${state.userName}"),
                Text("Mail: ${state.userEmail}"),
                Text("Giriş: ${state.loggedIn}"),
              ],
            );
          },
        ),
      ),
    );
  }
}
