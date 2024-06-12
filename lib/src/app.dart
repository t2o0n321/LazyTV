import 'package:flutter/material.dart';
import 'package:lazytv/src/views/discover.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LazyTV',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const DiscoverView(),
    );
  }
}