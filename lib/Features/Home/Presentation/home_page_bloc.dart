import 'package:assessment/Features/Home/Data/dog_modal.dart';
import 'package:assessment/Features/Home/Domain/repo_definition.dart';
import 'package:assessment/Features/Home/Presentation/home_page_event.dart';
import 'package:assessment/Features/Home/Presentation/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomeEvent,HomePageState>{
  FetchDogsDataRepo fetchDogsDataRepo;
  HomePageBloc({required this.fetchDogsDataRepo}):super(InitialState()){



    on<FetchDataEvent>((event, emit) async {

      if(state is InitialState){
        emit(LoadingState());
      }
        print("object1");
        List<Map<String,dynamic>> data = await fetchDogsDataRepo.fetchData();
        print("object");
          List<DogListModal> dogList= data.map((json) => DogListModal.fromJson(json)).toList();
          emit(LoadedState(dogList,event.a));


    },);

    _init();


    }

    @override
    void onChange(Change<HomePageState> change){
      super.onChange(change);
      print("HomeBloc---$change");
    }

  void _init() {
    add(FetchDataEvent(5));
  }







}