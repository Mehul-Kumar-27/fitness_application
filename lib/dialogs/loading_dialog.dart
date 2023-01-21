import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Container(
        height: 200,
        child: Column(
          children: [
            circularProgressBar(),
            const SizedBox(
              height: 10,
            ),
            Text(message!),
          ],
        ),
      ),
    );
  }
}

circularProgressBar() {
  return Container(
    height: 70,
    alignment: Alignment.center,
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.blue),
    ),
  );
}
