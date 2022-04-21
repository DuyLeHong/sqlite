import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/presenation/create_dog/create_update_dog.dart';
import 'package:sqlite/presenation/dog_list/dog_list_bloc.dart';
import 'package:sqlite/presenation/dog_list/dog_list_state.dart';

import '../dog_detail/dog_page.dart';
import 'dog_list_event.dart';

class DogListPage extends StatefulWidget {
  const DogListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DogListState();
}

class _DogListState extends State<DogListPage> {
  @override
  void initState() {
    context.read<DogListBloc>().add(FetchDogListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog List in data base'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            BlocBuilder<DogListBloc, DogListState>(
              builder: (_, state) {
                final dogs = state.dogs;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      final dog = dogs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DogPage(
                                id: dog.id,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text('id: ${dog.id}'),
                            const SizedBox(width: 10),
                            Text('name: ${dog.name}'),
                            const SizedBox(width: 10),
                            Text('age: ${dog.age}'),
                            const SizedBox(width: 30),
                            TextButton(
                                onPressed: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateUpdateDog(),
                                    ),
                                  );
                                  context.read<DogListBloc>().add(
                                        FetchDogListEvent(),
                                      );
                                },
                                child: const Text('Update')),
                            const SizedBox(width: 10),
                            TextButton(
                                onPressed: () {
                                  context.read<DogListBloc>().add(
                                        DeleteDogEvent(id: dog.id),
                                      );
                                },
                                child: const Text('Delete')),
                          ],
                        ),
                      );
                    },
                    itemCount: dogs.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateUpdateDog(),
            ),
          );
          context.read<DogListBloc>().add(
                FetchDogListEvent(),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
