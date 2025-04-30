import 'package:assessment/Features/Detail/Data/detail_repo_implementaion.dart';
import 'package:assessment/Features/Detail/Presentation/detail_bloc.dart';
import 'package:assessment/Features/History/Data/history_repo_implementation.dart';
import 'package:assessment/Features/History/Presentation/history_bloc.dart';
import 'package:assessment/FireBase/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/Features/Home/Presentation/home_page.dart';
import 'package:assessment/Features/Home/Presentation/home_page_bloc.dart';
import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  await FirebaseApi().initNotification();
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
        BlocProvider(create:   (_) => DetailBoc(detailRepoDefinition: DetailRepoImplementation()),),
        BlocProvider(create: (_)=> HistoryBloc(historyRepoDefinition: HistoryRepoImplementation())),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
