import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/presenation/dog_detail/dog_bloc.dart';
import 'package:sqlite/presenation/dog_detail/dog_state.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    // context.watch<DogBloc>().add(FetchDogEvent(id: id));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<DogBloc, DogState>(
          builder: (_, state) {
            final dog = state.dog;
            return Column(
              children: [
                Row(
                  children: [
                    const Text('id: '),
                    Text('${dog?.id}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('name: '),
                    Text('${dog?.name}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('age: '),
                    Text('${dog?.age}'),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
