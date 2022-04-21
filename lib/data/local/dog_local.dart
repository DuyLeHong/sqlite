import 'package:sqflite/sqflite.dart';
import 'package:sqlite/data/model/dog.dart';

import 'dog_db.dart';

class DogLocal {
  Future<List<Dog>> getDogList() async {
    // Get a reference to the database.
    final db = await DogDb.openDb();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<bool> createDog(Dog dog) async {
    // Get a reference to the database.
    final db = await DogDb.openDb();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return true;
  }

  Future<Dog> getDogById(int id) async {
    // get a reference to the database
    Database db = await DogDb.openDb();

    // get single row
    List<String> columnsToSelect = [
      'id',
      'name',
      'age',
    ];
    String whereString = 'id = ?';
    int rowId = 1;
    List<dynamic> whereArguments = [rowId];
    List<Map> result = await db.query('dogs',
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    if (result.isNotEmpty) {
      return Dog(
        id: result[0]['id'],
        name: result[0]['name'],
        age: result[0]['age'],
      );
    }

    throw Exception('Not found');
  }

  Future deleteDog(int id) async {
    // Get a reference to the database.
    final db = await DogDb.openDb();
    db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}
