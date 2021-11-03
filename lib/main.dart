import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/metrics_cubit.dart';
import 'package:tonal_mobile_coding_challenge/presentation/views/demo_screen/demo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Here we give a context for our Metrics Cubit to our app, since this is a
    // simple app with only one Cubit we just give our app global access to it.
    return BlocProvider<MetricsCubit>(
      create: (context) => MetricsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DemoScreen(),
      ),
    );
  }
}
