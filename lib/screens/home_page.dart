import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var emailU = "Null";
  var passwordU = "Null";

  @override
  void initState() {
    super.initState();
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: Colors.white.withOpacity(0.5),
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(emailU),
              const SizedBox(
                height: 10,
              ),
              Text(passwordU),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(LoginScreenState.KEY_LOGIN, false);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getValues() async {
    var prefs = await SharedPreferences.getInstance();
    var getEmail = prefs.getString(LoginScreenState.USER_EMAIL);
    var getPassword = prefs.getString(LoginScreenState.USER_PASSWORD);
    emailU = getEmail ?? 'Null';
    passwordU = getPassword ?? 'Null';
    setState(() {});
  }
}
