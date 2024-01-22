import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  static const String KEY_LOGIN = "login";
  static const String USER_EMAIL = "Null";
  static const String USER_PASSWORD = "Null";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(21),
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  //if successfully logged in
                  var userEmail = email.text.toString();
                  var userPassword = password.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(KEY_LOGIN, true);
                  prefs.setString(USER_EMAIL, userEmail);
                  prefs.setString(USER_PASSWORD, userPassword);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool(KEY_LOGIN);
    if (isLoggedIn != null) {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }
  }
}
