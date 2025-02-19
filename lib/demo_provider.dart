//import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  final int counter;
  final String username;
  final bool isLoading;

  CounterState({
    required this.counter,
    required this.username,
    required this.isLoading,
  });

  // Copy method for immutability
  CounterState copyWith({int? counter, String? username, bool? isLoading}) {
    return CounterState(
      counter: counter ?? this.counter,
      username: username ?? this.username,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel()
    : super(CounterState(counter: 0, username: 'Guest', isLoading: false));

  // Increment counter
  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  // Decrement counter
  void decrement() {
    state = state.copyWith(counter: state.counter - 1);
  }

  // Update username
  void updateUsername(String newName) {
    state = state.copyWith(username: newName);
  }

  // Toggle loading state
  void toggleLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }
}

final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, CounterState>((ref) {
      return CounterViewModel();
    });

// // Define a StateNotifier for the ViewModel
// class CounterViewModel extends StateNotifier<int> {
//   // Constructor initializing the state
//   CounterViewModel() : super(0);

//   // Method to increment the counter
//   void increment() {
//     state++;
//   }

//   // Method to decrement the counter
//   void decrement() {
//     state--;
//   }
// }

// // Create a provider for the CounterViewModel
// final counterViewModelProvider = StateNotifierProvider<CounterViewModel, int>((
//   ref,
// ) {
//   return CounterViewModel();
// });
