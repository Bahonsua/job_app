import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      home: MyBirthdayApp(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
      ],
    ),
  );
}

class MyBirthdayApp extends StatefulWidget {
  @override
  _MyBirthdayAppState createState() => _MyBirthdayAppState();
}

class _MyBirthdayAppState extends State<MyBirthdayApp> {
  bool showMamng = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOVEMBER 29, 2025"),
        backgroundColor: const Color.fromARGB(255, 30, 233, 64),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/picture.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showMamng
                  ? Text(
                      "MANGKI,",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    )
                  : Text(
                      "HAPPY BIRTHDAY 🎂",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
              const SizedBox(height: 30),

              // 🎂 Cake button
              if (showMamng)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("🎉 Surprise HEHEHE!"),
                        content: Text(
                          "Happy Birthday MANGKI, 🥳 Wishing you lots of joy, success, "
                          "and love today and always. Enjoy your special day!"
                          "ug mag pray pud ka diha segi nga ma duol ka ni GOD🥳💋",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("🎂", style: TextStyle(fontSize: 30)),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 30, 233, 61),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {
            setState(() {
              showMamng = !showMamng;
            });
          },
          child: Text(
            "Abrihi Surprise 🥳🎉",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
