import 'package:flutter/material.dart';
import 'package:snow_rewards/color_schemes.g.dart';
import 'package:snow_rewards/home_page.dart';
import 'package:snow_rewards/passport_page.dart';
import 'package:snow_rewards/profile_page.dart';
import 'package:snow_rewards/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        useMaterial3: true,
        colorScheme: lightColorScheme,
        primarySwatch: Colors.blue,
      ),
      /*home: SplashScreen(
            seconds: 2,
            navigateAfterSeconds: Root(),
            image: new Image.asset('assets/Exploring-pana.png'),
            photoSize: 100.0,
            backgroundColor: Colors.blue,
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Colors.white)*/
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentPage = 0;

  List<Widget> _pages = <Widget>[
    const HomePage(),
    const PassportPage(),
    const ProfilePage(),
  ];

  void onSelectPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snow Rewards"),
      ),
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: NavigationBar(
        //TODO: Link these to the actual pages
        selectedIndex: _currentPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            label: "Passport",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onDestinationSelected: onSelectPage,
      ),
    );
  }
}
