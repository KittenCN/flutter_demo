import 'package:flutter/material.dart';
import 'src/first_page.dart';
import 'src/second_page.dart';
import 'src/third_page.dart';
import 'src/four_page.dart';
import 'src/five_page.dart';

void main() {
  return runApp(const MyApp());
}

class Menu {
  final String name;
  final String route;
  final WidgetBuilder builder;
  Menu({required this.name, required this.route, required this.builder});
}

final menus = [
  Menu(
      name: 'FirstPage',
      route: '/FirstPage',
      builder: (context) => const FirstPage()),
  Menu(
      name: 'SecondPage',
      route: '/SecondPage',
      builder: (context) => const SecondPage()),
  Menu(
      name: 'ThirdPage',
      route: '/ThirdPage',
      builder: (context) => const ThirdPage()),
  Menu(
      name: 'FourPage',
      route: '/FourPage',
      builder: (context) => const FourPage()),
  Menu(
      name: 'FivePage',
      route: '/FivePage',
      builder: (context) => const FivePage()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Map.fromEntries(menus.map((e) => MapEntry(e.route, e.builder))),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView(children: [...menus.map((e) => MenuTile(menu: e))]));
  }
}

class MenuTile extends StatelessWidget {
  final Menu? menu;
  const MenuTile({Key? key, this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menu!.name),
      onTap: () {
        Navigator.pushNamed(context, menu!.route);
      },
    );
  }
}
