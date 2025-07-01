import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Domain/todo_cubit_repo_interface.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_event.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_state.dart';
import 'package:assessment/Modals/PostModal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoBloc extends Bloc<TodoEvent,TodoState>{
  TodoBlocRepoInterface todoBlocRepoInterface;
  TodoBloc({required this.todoBlocRepoInterface}):super(InitialTodoState()){

    on<TodoFetchEvent>((event,emit)async{


      emit(TodoLoadingState());

      // Future.delayed(const Duration(seconds: 2));

      List<PostModal> data = await todoBlocRepoInterface.fetchData();
      print("count is >>>>>>>>>>${data.length}");
      if(data.isNotEmpty){
        emit(TodoFetchedState(data));
      }




    });

  }

  @override
  void onChange(Change<TodoState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("this is the change >>> $change");
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print("this is transition $transition");
  }

}