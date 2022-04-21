import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/data/local/dog_local.dart';
import 'package:sqlite/presenation/dog_list/dog_list_state.dart';

import 'dog_list_event.dart';

class DogListBloc extends Bloc<DogListEvent, DogListState> {
  final dogLocal = DogLocal();

  DogListBloc() : super(DogListState(dogs: [])) {
    on<DogListEvent>((event, emit) async {
      if (event is FetchDogListEvent) {
        final dogList = await dogLocal.getDogList();
        emit(DogListState(dogs: dogList));
      } else if (event is DeleteDogEvent) {
        final id = event.id;
        await dogLocal.deleteDog(id);
        add(FetchDogListEvent());
      }
    });
  }
}
