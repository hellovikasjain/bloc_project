import 'package:assessment/Features/History/Data/history_data_provider.dart';
import 'package:assessment/Features/History/Domain/history_repo_definition.dart';

class HistoryRepoImplementation extends HistoryRepoDefinition{

  @override
  Future<List<Map<String,dynamic>>> fetchHistoryData()async{

    return HistoryDataProvider().getHistoryData();


  }

}