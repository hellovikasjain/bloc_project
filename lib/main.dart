import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:assessment/Features/Home/Domain/repo_definition.dart';
import 'package:assessment/Features/Home/Presentation/home_page.dart';
import 'package:assessment/Features/Home/Presentation/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>HomePageBloc(fetchDogsDataRepo: FetchDataImp()) ,)
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
