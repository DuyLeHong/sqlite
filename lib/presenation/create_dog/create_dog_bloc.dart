import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/data/local/dog_local.dart';
import 'package:sqlite/data/model/dog.dart';
import 'package:sqlite/presenation/create_dog/create_dog_event.dart';

import 'create_dog_state.dart';

class CreateDogBloc extends Bloc<CreateDogEvent, CreateDogState> {
  final dogLocal = DogLocal();

  CreateDogBloc() : super(CreateDogState()) {
    on<CreateDogEvent>((event, emit) {
      if (event is SaveDog) {
        final id = int.parse(event.id);
        final name = event.name;
        final age = int.parse(event.age);

        // xử lý business
        // save data to database
        // xác định được nó là create hay update dog

        var dog = state.dog;

        if (state.dog != null) {
        } else {
          final dog = Dog(id: id, name: name, age: age);
          dogLocal.createDog(dog);
        }

        // update thay đổi lên UI
        // final newState = CreateDogState()..dog = dog;
        final newState = CreateDogState();
        newState.dog = dog;
        emit(newState);
      }
    });
  }
}
