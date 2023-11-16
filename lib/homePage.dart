import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


String now() => DateTime.now().toIso8601String();

@immutable
class Seconds {
  final String value;

  Seconds() : value = now();
}

@immutable
class Minutes {
  final String value;

  Minutes() : value = now();
}

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final seconds = context.watch<Seconds>();
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.yellow.shade200,
        child: Text(seconds.value),
      ),
    );
  }
}

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final minutes = context.watch<Minutes>();
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.lime.shade400,
        child: Text(minutes.value),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}