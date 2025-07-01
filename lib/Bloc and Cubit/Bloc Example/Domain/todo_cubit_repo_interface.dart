import 'package:assessment/Modals/PostModal.dart';

abstract class TodoBlocRepoInterface{

  Future<List<PostModal>> fetchData();


}