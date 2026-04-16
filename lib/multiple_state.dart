import 'package:flutter/material.dart';


class MultipleStateProvider extends StatefulWidget {
  const MultipleStateProvider({super.key});

  @override
  State<MultipleStateProvider> createState() => _MultipleStateProviderState();
}

class _MultipleStateProviderState extends State<MultipleStateProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello"),),
    );
  }
}