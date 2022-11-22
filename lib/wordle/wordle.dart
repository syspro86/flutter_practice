import 'package:flutter/material.dart';
import 'package:flutter_practice/wordle/play.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  final String title = "wordle";

  @override
  Widget build(BuildContext context) {
    return PlayPage(title: title);
  }
}
