import 'package:assessment/Features/Detail/Domain/detail_repo_definition.dart';
import 'package:assessment/Features/Detail/Domain/dog_detail_use_cases.dart';
import 'package:assessment/Features/Detail/Presentation/DetailEvent.dart';
import 'package:assessment/Features/Detail/Presentation/DetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBoc extends Bloc<DetailsEvent,DetailState>{

  AdoptDogUseCase adoptDogUseCase;
  DetailBoc({required this.adoptDogUseCase}):super(AdoptInitialState()){

    on<AdoptEvent>((event,emit)async{

      emit(AdoptIsLoading());

      await Future.delayed(const Duration(seconds: 2));

      await adoptDogUseCase(event.data);

      emit(AdoptIsCompleted());


    });
  }

}