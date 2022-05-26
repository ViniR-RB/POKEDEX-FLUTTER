import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
    this.error, {
    Key? key,
  }) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
