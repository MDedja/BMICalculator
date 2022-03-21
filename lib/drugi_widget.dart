import 'package:flutter/material.dart';

class DrugiWidget extends StatelessWidget {
  const DrugiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Vas BMI je jednak: 24.7 kg/m^2"),
            Image.network(
              "https://media.istockphoto.com/photos/body-mass-index-written-on-a-notepad-sheet-picture-id528072248?b=1&k=20&m=528072248&s=170667a&w=0&h=ekzfEXFn0C4NVMww8x1vQw3UIGvkS8qmIraIIdarQk0=",
              height: 200.0,
              width: 350.0,
            ),
            InkWell(
              child: const Text("Racunaj ponovo"),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
