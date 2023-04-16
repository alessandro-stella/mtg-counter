import 'package:flutter/material.dart';

class ManaCounter extends StatefulWidget {
  const ManaCounter({super.key, required this.type});

  final String type;

  @override
  State<ManaCounter> createState() => _ManaCounterState();
}

class _ManaCounterState extends State<ManaCounter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            "assets/${widget.type}.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () => setState(() {
                    counter++;
                  }),
                  child: const Text("Up"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () => setState(() {
                    counter = counter-- > 0 ? counter-- : 0;
                  }),
                  child: const Text("Down"),
                ),
              )
            ],
          ),
          Center(
            child: Text(
              counter.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
