import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Data/data_Provider.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Domain/todo_cubit_repo_interface.dart';
import 'package:assessment/Modals/PostModal.dart';

class TodoBlocRepoDefinition implements TodoBlocRepoInterface{
  @override
  Future<List<PostModal>> fetchData()async{

    List<PostModal> data = await ServiceProvider().getData();
    return data;



  }

}