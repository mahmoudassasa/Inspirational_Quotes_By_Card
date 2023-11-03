import 'package:flutter/material.dart';
import 'package:inspirational_quotes_by_card/main.dart';

class QuotesCards extends StatelessWidget {
  const QuotesCards({
    super.key,
    // required this.vcontent,
    // required this.vauthor,
    required this.delete, required this.item,
  });
  // final String vcontent;
  // final String vauthor;
  final Function delete;
  final BestQuotes item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      color: const Color(0xFFF17300),
      margin: const EdgeInsets.all(11),
      child: Container(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              // vcontent,
              item.content,
              style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // vauthor,
                  item.author,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      delete(item);
                      
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
