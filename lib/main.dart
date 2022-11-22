import 'package:flutter/material.dart';
import 'package:flutter_practice/wordle/wordle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  late List<String> menus;
  late List<Widget> links;

  @override
  void initState() {
    super.initState();

    menus = [];
    links = [];

    menus.add("wordle");
    links.add(const WordlePage());
  }

  void movePage(BuildContext context, Widget link) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(children: [
        for (var i = 0; i < menus.length; i++) pageLink(context, i)
      ]),
    );
  }

  Widget pageLink(BuildContext context, int i) {
    return Row(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            onPressed: () => movePage(context, links[i]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(menus[i], style: const TextStyle(fontSize: 20)),
            )),
      ))
    ]);
  }
}
