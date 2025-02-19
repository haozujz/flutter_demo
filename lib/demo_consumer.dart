import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo/demo_provider.dart';

// The View that displays the counter and provides buttons to interact with the ViewModel
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the counter state provided by the ViewModel
    final counter = ref.watch(counterViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current counter value:', style: TextStyle(fontSize: 24)),
            Text(
              '$counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Button to increment the counter
            ElevatedButton(
              onPressed: () {
                // Access the ViewModel through the provider and call increment
                ref.read(counterViewModelProvider.notifier).increment();
              },
              child: const Text('Increment'),
            ),
            const SizedBox(height: 10),
            // Button to decrement the counter
            ElevatedButton(
              onPressed: () {
                // Access the ViewModel through the provider and call decrement
                ref.read(counterViewModelProvider.notifier).decrement();
              },
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
