import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var nameController = TextEditingController();
  static const String kEYNAME = "name";
  var nameValue = "No value saved....";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Prefrences Flutter'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var name = nameController.text.toString();
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString(kEYNAME, name);
                    setState(() {});
                  },
                  child: const Text('save'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(nameValue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(kEYNAME);

    nameValue = getName ?? 'No name value saved....';
    setState(() {});
  }
}
