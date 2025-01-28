import 'package:assessment/Features/Home/Data/data_provider.dart';
import 'package:assessment/Features/Home/Domain/repo_definition.dart';

class FetchDataImp extends FetchDogsDataRepo{


  @override
   Future<List<Map<String,dynamic>>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    List<Map<String,dynamic>> response =await HomeDataProvider().getData();
    return response;

  }
}