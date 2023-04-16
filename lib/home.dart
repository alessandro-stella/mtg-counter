import 'package:flutter/material.dart';
import 'package:mtg_counter/mana_counter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double borderSize = 5;

    return SafeArea(
        child: Scaffold(
            body: Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(borderSize),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ManaCounter(type: "plain"),
                  SizedBox(width: borderSize),
                  const ManaCounter(type: "island")
                ],
              ),
            ),
            SizedBox(height: borderSize),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ManaCounter(type: "swamp"),
                  SizedBox(width: borderSize),
                  const ManaCounter(type: "mountain")
                ],
              ),
            ),
            SizedBox(height: borderSize),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ManaCounter(type: "forest"),
                SizedBox(width: borderSize),
                const ManaCounter(type: "colorless")
              ],
            ))
          ],
        ),
      ),
    )));
  }
}
