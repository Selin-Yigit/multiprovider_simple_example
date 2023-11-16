import 'package:flutter/material.dart';


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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}