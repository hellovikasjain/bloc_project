import 'package:assessment/Features/History/Domain/history_repo_definition.dart';
import 'package:assessment/Features/History/Presentation/history_event.dart';
import 'package:assessment/Features/History/Presentation/history_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState>{
  HistoryRepoDefinition historyRepoDefinition;

  HistoryBloc({required this.historyRepoDefinition}):super(HistoryInitialState()){
    on<FetchHistoryData>((event,emit) async{

      emit(HistoryLoading());

      List<Map<String,dynamic>> list = await historyRepoDefinition.fetchHistoryData();

      await Future.delayed(const Duration(seconds: 2));

      emit(HistoryLoaded(data: list));



    });

    _init();
  }
  @override
  void onChange(Change<HistoryState> change){
    super.onChange(change);
    debugPrint("HistoryBloc---$change");
  }

  void _init(){
    add(FetchHistoryData());
  }

}