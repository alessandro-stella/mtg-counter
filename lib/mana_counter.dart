import 'package:flutter/material.dart';

class ManaCounter extends StatelessWidget {
  const ManaCounter(
      {super.key,
      required this.type,
      required this.value,
      required this.setter});

  final String type;
  final int value;
  final dynamic setter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            "assets/$type.png",
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
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () => setter(type, value + 1),
                  child: const Icon(
                    Icons.expand_less,
                    size: 40,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () => setter(type, value - 1 > 0 ? value - 1 : 0),
                  child: const Icon(
                    Icons.expand_more,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Text(
              value.toString(),
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
