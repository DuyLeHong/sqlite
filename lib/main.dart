import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite/presenation/create_dog/create_dog_bloc.dart';
import 'package:sqlite/presenation/dog_detail/dog_bloc.dart';
import 'package:sqlite/presenation/dog_list/dog_list_bloc.dart';
import 'package:sqlite/presenation/dog_list/dog_list_page.dart';

void main() {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DogListBloc>(
          create: (_) => DogListBloc(),
        ),
        BlocProvider<CreateDogBloc>(
          create: (_) => CreateDogBloc(),
        ),
        BlocProvider<DogBloc>(
          create: (_) => DogBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DogListPage(),
    );
  }
}
