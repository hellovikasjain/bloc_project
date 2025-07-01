import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Data/todo_bloc_repo_definition.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Domain/todo_cubit_repo_interface.dart';
import 'package:assessment/Features/Detail/Data/detail_repo_implementaion.dart';
import 'package:assessment/Features/Detail/Domain/detail_repo_definition.dart';
import 'package:assessment/Features/Detail/Domain/dog_detail_use_cases.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void repoAndServicesLocator(){
  getIt.registerSingleton<TodoBlocRepoInterface>(TodoBlocRepoDefinition());
  getIt.registerSingleton<DetailRepoDefinition>(DetailRepoImplementation());

  getIt.registerSingleton<AdoptDogUseCase>(AdoptDogUseCase(getIt<DetailRepoDefinition>()));
}