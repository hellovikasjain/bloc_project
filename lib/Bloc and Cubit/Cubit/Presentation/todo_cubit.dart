import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Domain/todo_cubit_repo_interface.dart';
import 'package:assessment/Bloc%20and%20Cubit/Cubit/Presentation/todo_cubit_state.dart';
import 'package:assessment/Modals/PostModal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoCubitState>{
  TodoBlocRepoInterface todoBlocRepoInterface;
  TodoCubit({required this.todoBlocRepoInterface}):super(InitialTodoCubitState());

  Future<void> fetchData()async{
    emit(TodoCubitLoadingState());

    List<PostModal> data = await todoBlocRepoInterface.fetchData();
    if(data.isNotEmpty){
      emit(TodoCubitFetchedState(data));
    }
  }

}