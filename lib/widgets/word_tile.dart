import 'package:flutter/material.dart';
import '../models/word.dart';

class WordTile extends StatelessWidget {
  final Word word;
  final VoidCallback onDelete;

  const WordTile({super.key, required this.word, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth < 350 ? constraints.maxWidth : 350;

        return Align(
          alignment: Alignment.center,
          child: Container(
            width: maxWidth,
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 16),
                SizedBox(
                  width: maxWidth - 72, // 16+8+IconButton幅を引いた残り
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          word.english,
                          style: TextStyle(fontSize: 16,fontFamily: 'SUSEMono'),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          word.japanese,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}