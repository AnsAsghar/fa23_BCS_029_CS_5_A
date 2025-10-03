import 'package:flutter/material.dart';
import 'package:project/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/profile.dart';

void main() {
  runApp(const project());
}

class project extends StatelessWidget {
  const project({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  List<Widget> pages = const [home_page(), profile()];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),

      child: Scaffold(
        appBar: AppBar(
          title: Text("My first flutter app"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.green,
        ),
        body: pages[currentPage],
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.green,
          backgroundColor: Colors.green,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Colors.white),
              label: "About",
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            debugPrint("button pressed");
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
