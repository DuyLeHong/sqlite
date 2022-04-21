abstract class CreateDogEvent {}

class SaveDog extends CreateDogEvent {
  final String id;
  final String name;
  final String age;

  SaveDog({
    required this.id,
    required this.name,
    required this.age,
  });
}
