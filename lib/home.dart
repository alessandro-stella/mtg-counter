import 'package:flutter/material.dart';
import 'package:mtg_counter/center_button.dart';
import 'package:mtg_counter/life_counter.dart';
import 'package:mtg_counter/mana_counter.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showMana = false;
  bool throwingDices = false;

  int white = 0;
  int blue = 0;
  int black = 0;
  int red = 0;
  int green = 0;
  int colorless = 0;

  int myLife = 20;
  int opponentLife = 20;

  showMessageDialog(String title, String text, f) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF8e44ad)),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Annulla",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF8e44ad),
                  backgroundColor: const Color(0xFF8e44ad).withOpacity(0.25)),
              onPressed: () {
                f();
                Navigator.pop(context);
              },
              child: const Text(
                "Conferma",
                style: TextStyle(
                    color: Color(0xFF8e44ad), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void setValue(String valueToUpdate, int newValue) {
    switch (valueToUpdate) {
      case "plain":
        setState(() {
          white = newValue;
        });
        break;

      case "island":
        setState(() {
          blue = newValue;
        });
        break;

      case "swamp":
        setState(() {
          black = newValue;
        });
        break;

      case "mountain":
        setState(() {
          red = newValue;
        });
        break;

      case "forest":
        setState(() {
          green = newValue;
        });
        break;

      case "colorless":
        setState(() {
          colorless = newValue;
        });
        break;

      case "myLife":
        setState(() {
          myLife = newValue;
        });
        break;

      case "opponentLife":
        setState(() {
          opponentLife = newValue;
        });
        break;
    }
  }

  void resetMana() {
    setState(() {
      white = 0;
      blue = 0;
      black = 0;
      red = 0;
      green = 0;
      colorless = 0;
    });
  }

  void resetLife() {
    setState(() {
      myLife = 20;
      opponentLife = 20;
    });
  }

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
  }

  showAndHideMana() {
    setState(() {
      showMana = !showMana;
    });
  }

  throwDices() {
    if (throwingDices) return;

    setState(() {
      throwingDices = true;
    });

    Timer(const Duration(seconds: 10), () {
      setState(() {
        throwingDices = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double borderSize = 5;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(borderSize),
            child: Stack(
              children: [
                // Mana counters
                if (showMana)
                  Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ManaCounter(
                              type: "plain",
                              value: white,
                              setter: setValue,
                            ),
                            SizedBox(width: borderSize),
                            ManaCounter(
                              type: "island",
                              value: blue,
                              setter: setValue,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: borderSize),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ManaCounter(
                              type: "swamp",
                              value: black,
                              setter: setValue,
                            ),
                            SizedBox(width: borderSize),
                            ManaCounter(
                              type: "mountain",
                              value: red,
                              setter: setValue,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: borderSize),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ManaCounter(
                              type: "forest",
                              value: green,
                              setter: setValue,
                            ),
                            SizedBox(width: borderSize),
                            ManaCounter(
                              type: "colorless",
                              value: colorless,
                              setter: setValue,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                // Life counters
                if (!showMana)
                  Column(
                    children: [
                      LifeCounter(
                          isMe: false,
                          lifeCounter: opponentLife,
                          throwingDices: throwingDices,
                          setter: setValue),
                      SizedBox(height: borderSize),
                      LifeCounter(
                          isMe: true,
                          lifeCounter: myLife,
                          throwingDices: throwingDices,
                          setter: setValue)
                    ],
                  ),

                // Buttons
                if (!throwingDices)
                  Center(
                    child: showMana
                        ?
                        // Show for mana counters
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Change mode
                              CenterButton(
                                icon: Icons.sync_alt,
                                f: () => showAndHideMana(),
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                              //Reset values
                              CenterButton(
                                icon: Icons.sync,
                                f: () => showMessageDialog(
                                    "Attenzione",
                                    "Vuoi davvero resettare il mana in pool? Quest'azione non può essere annullata",
                                    resetMana),
                              ),
                            ],
                          )
                        :
                        // Show for life counters
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Change mode
                              CenterButton(
                                icon: Icons.sync_alt,
                                f: () => showAndHideMana(),
                              ),

                              const SizedBox(
                                width: 40,
                              ),

                              //Throw dice
                              CenterButton(
                                icon: Icons.casino,
                                f: () => throwDices(),
                              ),

                              const SizedBox(
                                width: 40,
                              ),

                              //Reset values
                              CenterButton(
                                icon: Icons.sync,
                                f: () => showMessageDialog(
                                    "Attenzione",
                                    "Vuoi davvero resettare la vita? Quest'azione non può essere annullata",
                                    resetMana),
                              ),
                            ],
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
