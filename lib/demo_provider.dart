import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifier for the ViewModel
class CounterViewModel extends StateNotifier<int> {
  // Constructor initializing the state
  CounterViewModel() : super(0);

  // Method to increment the counter
  void increment() {
    state++;
  }

  // Method to decrement the counter
  void decrement() {
    state--;
  }
}

// Create a provider for the CounterViewModel
final counterViewModelProvider = StateNotifierProvider<CounterViewModel, int>((
  ref,
) {
  return CounterViewModel();
});
