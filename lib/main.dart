import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
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

class _MyBirthdayAppState extends State<MyBirthdayApp>
    with TickerProviderStateMixin {
  bool showMamng = false;
  late AudioPlayer _audioPlayer;

  // 🎬 Animation Controllers
  late AnimationController _textController;
  late Animation<Alignment> _textAnimation;

  late AnimationController _cakeController;
  late Animation<Alignment> _cakeAnimation;

  @override
  void initState() {
    super.initState();

    // 🎶 Play music when app starts
    _audioPlayer = AudioPlayer();
    _playMusic();

    // 🎬 Text bouncing animation
    _textController = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);

    _textAnimation =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
            ),
            weight: 1,
          ),
        ]).animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
        );

    // 🎂 Cake bouncing animation
    _cakeController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _cakeAnimation =
        TweenSequence<Alignment>([
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
            weight: 0.1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
            weight: 0.1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
            weight: 0.1,
          ),
          TweenSequenceItem(
            tween: AlignmentTween(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
            weight: 0.1,
          ),
        ]).animate(
          CurvedAnimation(parent: _cakeController, curve: Curves.easeInOut),
        );
  }

  Future<void> _playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // play continuously
    await _audioPlayer.play(AssetSource('happy_birthday.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // stop music when app closes
    _textController.dispose();
    _cakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OCTOBER 27, 2025"),
        backgroundColor: const Color.fromARGB(255, 30, 233, 64),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/picture.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // 🎉 Bouncing Text
            if (!showMamng)
              AnimatedBuilder(
                animation: _textAnimation,
                builder: (context, child) {
                  return Align(
                    alignment: _textAnimation.value,
                    child: Text(
                      "🎉 HAPPY BIRTHDAY 🎂",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),

            // 🎂 Bouncing Cake button (only shows with MANGKI)
            if (showMamng)
              AnimatedBuilder(
                animation: _cakeAnimation,
                builder: (context, child) {
                  return Align(
                    alignment: _cakeAnimation.value,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(50),
                        backgroundColor: Colors.pink,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("🎉 Surprise HEHEHE!"),
                            content: Text(
                              "Happy Birthday MANGKI, 🥳 Wishing you lots of joy, success, "
                              "and love today and always. Enjoy your special day! "
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
                      child: Text("🎂Tap Me", style: TextStyle(fontSize: 30)),
                    ),
                  );
                },
              ),

            // 🎉 Static "MANGKI," text at center
            if (showMamng)
              Center(
                child: Text(
                  "MANGKI,",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
          ],
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
            "Tap And Surprise 🥳🎉",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
