import 'package:flutter/material.dart';
import 'package:tictactoe/components/homeScreen/Word.dart';
import 'package:tictactoe/helpers/CustomTheme.dart';

class EntryText extends StatefulWidget  {
  @override
  _EntryTextState createState() => _EntryTextState();
}

class _EntryTextState extends State<EntryText> with CustomTheme {
  final String title = "TICTACTOE";
  final ScrollController controller = ScrollController(initialScrollOffset: 40);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.width * 0.8,
      decoration: BoxDecoration(
        color: entryTextBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final Color color = (index % 2 == 0) ? Colors.red : Colors.yellow;
          return Word(word: title[index], color: color);
        },
        itemCount: title.length,
      ),
    );
  }
}
