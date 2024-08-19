import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const screenName = 'about';

  const AboutScreen({super.key});

  String _composeYears() {
    const startYear = 2024;
    final currentYear = DateTime.now().year;

    return startYear == currentYear
        ? currentYear.toString()
        : '$startYear - $currentYear';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '© Hey there!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _composeYears(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
