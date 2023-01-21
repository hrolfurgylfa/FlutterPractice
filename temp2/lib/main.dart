import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp2/home.dart';

// A Counter example implemented with riverpod

/// Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((ref) => 0);
final isDarkThemeProvider = StateProvider((ref) => false);

void toggleDarkTheme(WidgetRef ref) {
  ref.read(isDarkThemeProvider.notifier).state =
      !ref.read(isDarkThemeProvider.notifier).state;
}

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return MaterialApp(
        home: Home(),
        theme: ThemeData(
            brightness: isDarkTheme ? Brightness.dark : Brightness.light));
  }
}
