abstract class DogEvent {}

class FetchDogEvent extends DogEvent {
  final int id;

  FetchDogEvent({required this.id});
}
