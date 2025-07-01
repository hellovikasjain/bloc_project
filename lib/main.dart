import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Data/todo_bloc_repo_definition.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Domain/todo_cubit_repo_interface.dart';
import 'package:assessment/Bloc%20and%20Cubit/Cubit/Presentation/todo_cubit.dart';
import 'package:assessment/Features/Detail/Domain/dog_detail_use_cases.dart';
import 'package:assessment/Features/Detail/Presentation/detail_bloc.dart';
import 'package:assessment/Features/History/Data/history_repo_implementation.dart';
import 'package:assessment/Features/History/Presentation/history_bloc.dart';
import 'package:assessment/FireBase/firebase_api.dart';
import 'package:assessment/Routs/app_routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/Features/Home/Presentation/home_page_bloc.dart';
import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:assessment/Injector/injector_class.dart' as injector;

import 'Bloc and Cubit/Bloc Example/Presentation/todo_bloc.dart';
import 'Injector/injector_class.dart';
import 'l10n/app_localizations.dart';

void main() async{
  injector.repoAndServicesLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  await FirebaseApi().initNotification();
  await Hive.initFlutter();
  await Hive.openBox("dogBox");
  Hive.init("dogBox");
  OneSignal.Debug.setLogLevel(OSLogLevel.debug);
  OneSignal.initialize("53b3744c-867e-4632-8741-f22a1688af3b");
  OneSignal.Notifications.requestPermission(true);


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
        BlocProvider(create:   (_) => DetailBoc(adoptDogUseCase: getIt<AdoptDogUseCase>()),),
        BlocProvider(create: (_)=> HistoryBloc(historyRepoDefinition: HistoryRepoImplementation())),
        BlocProvider(create: (_)=>TodoBloc(todoBlocRepoInterface: getIt<TodoBlocRepoInterface>())),
        BlocProvider(create: (_)=>TodoCubit(todoBlocRepoInterface: TodoBlocRepoDefinition())),
      ],
      child:  MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('hi'),
        restorationScopeId: 'app',
        routerConfig: AppRouts().route,
        // routeInformationParser: AppRouts().route.routeInformationParser,
        // routerDelegate: AppRouts().route.routerDelegate,

      ),
    );
  }
}
