import 'package:flutter/material.dart';

class Budgets extends StatelessWidget {
  const Budgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('budgets'),
        ),
        body: const Center(child: Text('trnsactions')));
  }
}
