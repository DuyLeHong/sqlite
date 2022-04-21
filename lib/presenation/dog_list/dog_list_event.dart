abstract class DogListEvent {}

class FetchDogListEvent extends DogListEvent {}

class DeleteDogEvent extends DogListEvent {
  final int id;

  DeleteDogEvent({required this.id});
}
