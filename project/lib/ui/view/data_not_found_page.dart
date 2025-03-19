import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataNotFoundPage extends StatelessWidget {
  String message;
  DataNotFoundPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(message,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
