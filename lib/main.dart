import 'package:flutter/material.dart';
import './quotes.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const QuotesLocal());
}

class QuotesLocal extends StatefulWidget {
  const QuotesLocal({
    Key? key,
  }) : super(key: key);

  @override
  State<QuotesLocal> createState() => _QuotesLocalState();
}

class _QuotesLocalState extends State<QuotesLocal> {
  var quote = "";
  var author = "";

  setQuote() {
    var randomNumber = Random().nextInt(quotes.length);
    setState(() {
      quote = quotes[randomNumber]["quote"]!;
      author = quotes[randomNumber]["author"]!;
    });
  }

  @override
  initState() {
    setQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  quote,
                  style: GoogleFonts.alata(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                Text(
                  author,
                  style: GoogleFonts.lobster(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Image.asset(
                      'assets/shuffle.png',
                      width: 100,
                    ),
                    onPressed: setQuote,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
