import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp2/main.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => toggleDarkTheme(ref),
            child: Center(
              // Consumer is a widget that allows you reading providers.
              child: Consumer(builder: (context, ref, _) {
                final count = ref.watch(counterProvider);
                return Text('$count', style: const TextStyle(fontSize: 64));
              }),
            ),
          ),
          Consumer(builder: (context, ref, _) {
            final isDarkMode = ref.watch(isDarkThemeProvider);
            return Text("Dark Mode ${(isDarkMode ? 'Enabled' : 'Disabled')}");
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
