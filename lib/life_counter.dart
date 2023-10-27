import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:mtg_counter/dice.dart';

class LifeCounter extends StatelessWidget {
  const LifeCounter(
      {super.key,
      required this.isMe,
      required this.lifeCounter,
      required this.throwingDices,
      required this.setter});

  final bool isMe;
  final int lifeCounter;
  final bool throwingDices;
  final dynamic setter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Transform.rotate(
            angle: isMe ? 0 : math.pi,
            child: Stack(
              children: [
                Image.asset(
                  "assets/${isMe ? "urza" : "yawgmoth"}.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                if (throwingDices)
                  Container(
                    color: Colors.black.withOpacity(0.15),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Dice(),
                          SizedBox(
                            width: 30,
                          ),
                          Dice()
                        ],
                      ),
                    ),
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.15),
                              foregroundColor: Colors.black),
                          onPressed: () => setter(
                              isMe ? "myLife" : "opponentLife",
                              lifeCounter - 1),
                          child: const Icon(
                            Icons.remove,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.15),
                              foregroundColor: Colors.black),
                          onPressed: () => setter(
                              isMe ? "myLife" : "opponentLife",
                              lifeCounter + 1),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                if (!throwingDices)
                  Center(
                    child: Text(
                      lifeCounter.toString(),
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
              ],
            )));
  }
}
