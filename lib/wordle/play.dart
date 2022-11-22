import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key, required this.title});

  final String title;

  @override
  State<PlayPage> createState() => _PlayState();
}

class _PlayState extends State<PlayPage> {
  final int wordSize = 6;
  late List<String> _solution;
  late List<List<String>> _answers;
  late int _answerIndex;
  late int _inputIndex;
  late List<List<String>> _keys;

  @override
  void initState() {
    super.initState();

    _newGame();
  }

  void _newGame() {
    _solution = ["ㅈ", "ㅓ", "ㅇ", "ㄷ", "ㅏ", "ㅂ"];
    clearAnswers();
    _keys = [
      ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ", "ㅛ", "ㅕ", "ㅑ"],
      ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ", "ㅗ", "ㅓ", "ㅏ", "ㅣ"],
      ["ㅋ", "ㅌ", "ㅊ", "ㅍ", "ㅠ", "ㅜ", "ㅡ", "<", "!"],
    ];
  }

  void clearAnswers() {
    _answerIndex = 0;
    _answers = [];
    for (var i = 0; i < 6; i++) {
      _answers.add([for (var j = 0; j < wordSize; j++) ""]);
    }
    _inputIndex = 0;
  }

  void onAnswerAdded() {
    setState(() {
      _answerIndex++;
      _inputIndex = 0;
    });
  }

  void onKeySelected(String key) {
    if (key == "!") {
      if (_inputIndex != wordSize) {
        return;
      }
      onAnswerAdded();
      return;
    }
    if (key == "<") {
      if (_inputIndex > 0) {
        setState(() {
          _inputIndex--;
          _answers[_answerIndex][_inputIndex] = "";
        });
      }
      return;
    }
    if (_inputIndex < 6) {
      setState(() {
        _answers[_answerIndex][_inputIndex] = key;
        _inputIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(flex: 7, child: createAnswerSection()),
          Flexible(flex: 3, child: createInputSection()),
        ],
      ),
    );
  }

  Widget createAnswerRow(List<String> answer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(flex: 1, child: Text("")),
        for (String i in answer)
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                margin: const EdgeInsets.all(10),
                child: Center(child: Text(i))),
          ),
        const Expanded(flex: 1, child: Text("")),
      ],
    );
  }

  Widget createAnswerSection() {
    return Column(
      children: [for (var answer in _answers) createAnswerRow(answer)],
    );
  }

  Widget createInputSection() {
    return Column(
      children: [
        for (var row in _keys)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(flex: 1, child: Text("")),
              Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (row.length % 2 == 0)
                          const Flexible(
                              flex: 1, fit: FlexFit.tight, child: Text("")),
                        for (var key in row)
                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: TextButton(
                                  onPressed: () {
                                    onKeySelected(key);
                                  },
                                  child: Text(key))),
                        if (row.length % 2 == 0)
                          const Flexible(
                              flex: 1, fit: FlexFit.tight, child: Text("")),
                      ])),
              const Flexible(flex: 1, child: Text("")),
            ],
          ),
      ],
    );
  }
}
