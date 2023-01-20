import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:temp4/counter_page.dart';
import 'counter_cubit.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DarkModeCubit(),
      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, isDarkMode) => MaterialApp(
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => CounterCubit()),
            ],
            child: CounterPage(),
          ),
        ),
      ),
    );
  }
}
