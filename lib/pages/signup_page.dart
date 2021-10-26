import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_example/bloc/login_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty || val.length < 3
                            ? "3 Karakterden Fazla Giriniz"
                            : null;
                      },
                      controller: userNameController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: "Kullanıcı Adı",
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val.toString())
                            ? null
                            : "Geçerli Mail Adresi Girin";
                      },
                      controller: emailController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val!.length < 6
                            ? "6 Karakterden fazla gir"
                            : null;
                      },
                      controller: passwordController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: "Şifre",
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      bloc: BlocProvider.of<LoginBloc>(context),
                      builder: (context, LoginState state) {
                        return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).saveLoginUser(
                                userNameController.text, emailController.text);
                            Navigator.pushReplacementNamed(
                                context, "/homePage");
                          },
                          child: const Text(
                            "Kayıt Ol",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
