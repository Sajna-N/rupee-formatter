import 'package:flutter/material.dart';

import './widgets/text_field.dart';

void main() {
  runApp(const RupeeFormatter());
}

class RupeeFormatter extends StatelessWidget {
  const RupeeFormatter({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Rupee Formatter')),
        body: const Center(
          child: RupeeTextField(),
        ),
      ),
    );
  }
}
