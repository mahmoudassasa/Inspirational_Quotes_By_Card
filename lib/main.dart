import 'package:flutter/material.dart';
import 'package:inspirational_quotes_by_card/widgets/quotes_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuotesCard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuotesCard extends StatefulWidget {
  const QuotesCard({super.key});

  @override
  State<QuotesCard> createState() => _QuotesCardState();
}

//Class for quotes card
class BestQuotes {
  String content;
  String author;
  BestQuotes({required this.content, required this.author});
}

//List to store and add data
class _QuotesCardState extends State<QuotesCard> {
  List newCardQuotes = [
    BestQuotes(content: "Enter The Quotes Here.", author: "Author Name"),
    BestQuotes(
        content: "Every man dies. Not every man lives.",
        author: "William Wallace"),
    BestQuotes(
        content:
            "Always bear in mind that your own resolution to succeed is more important than any other.",
        author: "Abraham Lincoln"),
  ];
//Function to add new quotes to the list
  final cont = TextEditingController();
  final authorCont = TextEditingController();
  addNewQuote() {
    setState(() {
      newCardQuotes
          .add(BestQuotes(content: cont.text, author: authorCont.text));
    });
  }

//Function to delete QUOTE CARD from list when you click on delete button
  delete(BestQuotes item) {
    setState(() {
      newCardQuotes.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDFC2),
      appBar: AppBar(
        title: const Text(
          "Quotes Card",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: const Color(0xFFF17300),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...newCardQuotes
                .map((item) => QuotesCards(
                  //to pass data to anpther file "quotes_card.dart"
                      // vcontent: item.content,
                      // vauthor: item.author,
                //We can use only that because we pass the "BestQuotes" Class, So now we dont need to use the above code  
                      delete: delete,
                      item: item,
                    ))
                .toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                    child: Container(
                      height: 270,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: cont,
                            maxLength: 50,
                            decoration: const InputDecoration(
                                labelText: "Write Your Quote"),
                          ),
                          TextField(
                            controller: authorCont,
                            maxLength: 25,
                            decoration:
                                const InputDecoration(labelText: "Author Name"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNewQuote();
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFFF17300))),
                            child: const Text(
                              "Add",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          backgroundColor: const Color(0xFFF17300),
          child: const Icon(
            Icons.add,
            size: 40,
          )),
    );
  }
}
