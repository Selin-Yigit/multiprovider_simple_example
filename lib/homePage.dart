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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 134, 80),
        title: const Text(
          "MultiProvider",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: MultiProvider(
        providers: [
          StreamProvider.value(
            value: Stream<Seconds>.periodic(
                const Duration(seconds: 1), (_) => Seconds()),
            initialData: Seconds(),
          ),
          StreamProvider.value(
            value: Stream<Minutes>.periodic(
                const Duration(minutes: 1), (_) => Minutes()),
            initialData: Minutes(),
          ),
        ],
        child: const Row(
          children: [
            SecondsWidget(),
            MinutesWidget(),
          ],
        ),
      ),
    );
  }
}