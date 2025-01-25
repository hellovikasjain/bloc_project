import 'package:assessment/Features/Home/Data/dog_modal.dart';
import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // given,when,then
  test("fetch data repo when call fucntion give dog list modal", ()async{

    // arrange
    final FetchDataImp fetchDataImp=FetchDataImp();
    //act
     var res = await fetchDataImp.fetchData();
    //assert
    expect(res, isA<List<Map<String,dynamic>>>());


  });
}