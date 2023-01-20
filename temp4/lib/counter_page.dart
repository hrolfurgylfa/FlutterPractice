import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "counter_cubit.dart";

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Column(
          children: [
            Center(child: Text('$count', style: const TextStyle(fontSize: 64))),
            BlocBuilder<DarkModeCubit, bool>(
              builder: (context, isDarkMode) =>
                  Text("Dark Mode ${isDarkMode ? 'Enabled' : 'Disabled'}"),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: BlocBuilder<DarkModeCubit, bool>(
                builder: (context, isDarkMode) =>
                    Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode)),
            onPressed: () => context.read<DarkModeCubit>().toggle(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
