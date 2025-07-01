import 'package:assessment/Modals/PostModal.dart';

abstract class TodoCubitState{


}


class InitialTodoCubitState extends TodoCubitState{

}

class TodoCubitLoadingState extends TodoCubitState{

}

class TodoCubitFetchedState extends TodoCubitState{

  List<PostModal> data;
  TodoCubitFetchedState(this.data);

}