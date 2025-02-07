import 'package:assessment/Features/Detail/Data/detail_repo_implementaion.dart';
import 'package:assessment/Features/Detail/Presentation/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/Features/Home/Presentation/home_page.dart';
import 'package:assessment/Features/Home/Presentation/home_page_bloc.dart';
import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("dogBox");
  Hive.init("dogBox");


  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomePageBloc(fetchDogsDataRepo: FetchDataImp()),

        ),
        BlocProvider(create:   (_) => DetailBoc(detailRepoDefinition: DetailRepoImplementaion()),)
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
