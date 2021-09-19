import 'package:catalog_app/routes.dart';
import 'package:catalog_app/shared/drawer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/login_image.png'),
              SizedBox(height: 20),
              Text(
                "Welcome $user",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          user = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            // border: InputBorder.none,
                            hintText: "Enter your Username",
                            label: Text("Username")),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password should be atleast of 6 characters";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          hintText: "Enter your Password",
                          label: Text("Password"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {});
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, myRoutes.home);
                  }
                },
                label: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
