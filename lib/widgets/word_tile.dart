import 'package:flutter/material.dart';
import 'package:it_dictionary/widgets/centered_max_width.dart';
import '../models/word.dart';

class WordTile extends StatelessWidget {
  final Word word;
  final VoidCallback onDelete;

  const WordTile({super.key, required this.word, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return CenteredMaxWidth(
      maxWidth: 400,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          return Row(
            children: [
              SizedBox(
                width: maxWidth - 90,  // IconButton = 40
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          word.leftKey,
                          style: TextStyle(fontSize: 16,fontFamily: 'SUSEMono'),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          word.rightKey,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: onDelete,
              ),
            ],
          );
        },
      ),
    );
  }
}