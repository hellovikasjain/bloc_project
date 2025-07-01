import 'package:assessment/Modals/PostModal.dart';

abstract class TodoState{


}


class InitialTodoState extends TodoState{

}

class TodoLoadingState extends TodoState{

}

class TodoFetchedState extends TodoState{

  List<PostModal> data;
  TodoFetchedState(this.data);

}