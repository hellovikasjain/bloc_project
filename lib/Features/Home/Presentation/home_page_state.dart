import 'package:assessment/Features/Home/Data/dog_modal.dart';

abstract class HomePageState{

}

class InitialState extends HomePageState{

}

class LoadingState extends HomePageState{

}

class LoadedState extends HomePageState{
  List<DogListModal> dogData;
  int len=5;
  LoadedState(this.dogData,int a){

    if(a<=15){
      len = len + a;
    }

    print("lentth ==$len");
  }
  get value=>len;

}