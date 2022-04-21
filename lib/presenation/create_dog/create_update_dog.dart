import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/presenation/create_dog/create_dog_bloc.dart';
import 'package:sqlite/presenation/create_dog/create_dog_event.dart';

import '../../data/model/dog.dart';

class CreateUpdateDog extends StatefulWidget {
  const CreateUpdateDog({Key? key, this.dog}) : super(key: key);

  final Dog? dog;

  @override
  _CreateUpdateDogState createState() => _CreateUpdateDogState();
}

class _CreateUpdateDogState extends State<CreateUpdateDog> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            const Text('id: '),
            const SizedBox(height: 8),
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            const Text('name: '),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
            ),
            const SizedBox(height: 8),
            const Text('age: '),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context.read<CreateDogBloc>().add(
                          SaveDog(
                            id: _idController.text,
                            name: _nameController.text,
                            age: _ageController.text,
                          ),
                        );

                    Navigator.of(context).pop();
                  },
                  child: const Text('Save Dog'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
