import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Pip extends StatelessWidget {
  const Pip({super.key, required this.hide});

  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          color: hide ? Colors.white : Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  List<int> hiddenPips = [];

  @override
  void initState() {
    super.initState();

    printStringWithIncreasingDelay();
  }

  changeDiceValue(int value) {
    switch (value) {
      case 1:
        setState(() {
          hiddenPips = [1, 2, 3, 5, 6, 7];
        });
        break;

      case 2:
        setState(() {
          hiddenPips = [1, 2, 4, 6, 7];
        });
        break;

      case 3:
        setState(() {
          hiddenPips = [1, 2, 6, 7];
        });
        break;

      case 4:
        setState(() {
          hiddenPips = [2, 4, 6];
        });
        break;

      case 5:
        setState(() {
          hiddenPips = [
            2,
            6,
          ];
        });
        break;

      case 6:
        setState(() {
          hiddenPips = [
            4,
          ];
        });
        break;

      default:
        break;
    }
  }

  void printStringWithIncreasingDelay() {
    const initialDelay = 10;
    const delayIncrement = 10;
    const repetitions = 30;
    const lastNumber = 0;

    void printString(int count, int lastNumber) {
      if (count <= repetitions) {
        final delay = initialDelay + ((count - 1) * delayIncrement);

        Timer(Duration(milliseconds: delay), () {
          final random = Random();
          int number;

          do {
            number = random.nextInt(6) + 1;
          } while (number == lastNumber);

          changeDiceValue(number);
          printString(count + 1, number);
        });
      }
    }

    printString(1, lastNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Pip(hide: hiddenPips.contains(1)),
                Pip(hide: hiddenPips.contains(2)),
                Pip(hide: hiddenPips.contains(3))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Pip(hide: hiddenPips.contains(4))],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Pip(hide: hiddenPips.contains(5)),
                Pip(hide: hiddenPips.contains(6)),
                Pip(hide: hiddenPips.contains(7))
              ],
            )
          ],
        ),
      ),
    );
  }
}
