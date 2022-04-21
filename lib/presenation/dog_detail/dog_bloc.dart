import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/data/local/dog_local.dart';
import 'package:sqlite/presenation/dog_detail/dog_event.dart';
import 'package:sqlite/presenation/dog_detail/dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final dogLocal = DogLocal();

  DogBloc() : super(DogState(dog: null)) {
    on<DogEvent>((event, emit) async {
      if (event is FetchDogEvent) {
        final id = event.id;
        final dog = await dogLocal.getDogById(id);
        emit(DogState(dog: dog));
      }
    });
  }
}
