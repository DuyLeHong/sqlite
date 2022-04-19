import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text('name+ '),
            const SizedBox(height: 8),
            const TextField(),
            const SizedBox(height: 8),
            Text('age+ '),
            const TextField(),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Save Dog'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Update Dog'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('id+ '),
                Text(''),
              ],
            ),
            Row(
              children: [
                Text('name+ '),
                Text(''),
              ],
            ),
            Row(
              children: [
                Text('age+ '),
                Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
