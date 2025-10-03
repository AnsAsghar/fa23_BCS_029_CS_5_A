import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class learnFlutter extends StatefulWidget {
  const learnFlutter({Key? key}) : super(key: key);

  @override
  State<learnFlutter> createState() => _learnFlutterState();
}

class _learnFlutterState extends State<learnFlutter> {
  bool isSwitch = false;
  bool? isCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Learn Flutter"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("nav bar info button pressed");
            },
            icon: Icon(
              Icons.info_rounded,
              color: const Color.fromARGB(232, 244, 243, 243),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/einstein.jpg',
                fit: BoxFit.cover,
                width: 400,
                height: 300,
              ),
            ),
            SizedBox(height: 10),
            const Divider(color: Colors.black),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.blueGrey,
                width: double.infinity,
                child: Text(
                  "this is Einstein",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.blue : Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                debugPrint("Elevated Button pressed!");
              },
              child: Text(
                "Elevated Button",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(padding: EdgeInsets.all(6.0)),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: const Color.fromARGB(255, 250, 250, 250),
              ),
              onPressed: () {
                debugPrint("debug button pressed!");
              },
              child: Text(
                "Outline Button",
                style: TextStyle(
                  color: const Color.fromARGB(248, 244, 244, 244),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint("gesture detected");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.local_fire_department),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      debugPrint("button pressed");
                    },
                    child: Text(
                      "row widget",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 1, 1, 1),
                      ),
                    ),
                  ),
                  Icon(Icons.local_fire_department),
                  Icon(Icons.local_fire_department),
                ],
              ),
            ),
            Switch(
              value: isSwitch,
              onChanged: (bool newVal) {
                setState(() {
                  isSwitch = newVal;
                });
              },
            ),
            Checkbox(
              value: isCheckBox,
              onChanged: (bool? newCheck) {
                setState(() {
                  isCheckBox = newCheck;
                });
              },
            ),
            SizedBox(height: 10),
            Text("this is me"),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYvCpU4PYu_6_KWmiwslfo3r8QJnOMWavguw&s",
            ),
          ],
        ),
      ),
    );
  }
}
