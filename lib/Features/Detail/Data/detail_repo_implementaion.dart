import 'package:assessment/Features/Detail/Data/details_data_provider.dart';
import 'package:assessment/Features/Detail/Domain/detail_repo_definition.dart';

class DetailRepoImplementaion extends DetailRepoDefinition{

  @override
  Future<void> adoptDog(String id) async {
    var response = await DetailsDataProvider().getData();
    var data= updateCanAdopt(id, false, response);

    await DetailsDataProvider().setData(data);

  }

  List<Map<String, dynamic>> updateCanAdopt(String id, bool newValue, List<Map<String, dynamic>> data) {
    try {
      // Find the dog with the matching ID
      var dog = data.firstWhere((dog) => dog['id'] == id);
      // Update the `canAdopt` value
      dog['canAdopt'] = newValue;


    } catch (e) {
      print("Dog with id $id not found.");
    }
    return data;
  }

}