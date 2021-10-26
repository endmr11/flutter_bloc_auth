import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_example/bloc/login_bloc.dart';
import 'package:flutter_login_example/helpers/auth_helper.dart';
import 'package:flutter_login_example/pages/home_page.dart';
import 'package:flutter_login_example/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? userName;
  String? userEmail;
  bool? userIsLoggedIn;
  userName = await AuthHelper.getUserNameSharedPreference();
  userEmail = await AuthHelper.getUserEmailSharedPreference();
  userIsLoggedIn = await AuthHelper.getUserLoggedInSharedPreference();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(
            LoginState(userName ?? "Boş Username", userEmail ?? "Boş Email",
                userIsLoggedIn ?? false),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: BlocProvider.of<LoginBloc>(context),
      builder: (context, LoginState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/homePage": (context) => const HomePage(),
            "/loginPage": (context) => const SignupPage(),
          },
          initialRoute: state.loggedIn ? "/homePage" : "/loginPage",
        );
      },
    );
  }
}
/*
MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/homepage": (context) => const HomePage(),
        "/loginPage": (context) => const LoginPage(),
        "/signupPage": (context) => const SignupPage(),
      },
      initialRoute: userIsLoggedIn ? "/homepage" : "/loginpage",
    );
*/