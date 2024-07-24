import 'package:flutter/material.dart';
import 'package:world_traveler/pages/home.dart';
import 'package:world_traveler/pages/rating.dart';
import 'package:world_traveler/pages/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // removes debug banner flag
      debugShowCheckedModeBanner: false,
      title: 'World Traveler',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 54, 71, 51),
        primaryColor: const Color.fromARGB(255, 50, 31, 7),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    const HomePageDetails(),
    const RatingDetails(),
    const CountryReviews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Kafele's Traveler Reviews")),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).primaryColor,
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: Theme.of(context).primaryColor,
          animationDuration: const Duration(seconds: 3),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.star),
              icon: Icon(Icons.star_border),
              label: 'Ratings',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_location_rounded),
              icon: Icon(Icons.add_location_outlined),
              label: 'Reviews',
            ),
          ],
        ),
      ),
    );
  }
}