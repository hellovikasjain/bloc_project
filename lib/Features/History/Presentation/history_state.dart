abstract class HistoryState{

}
class HistoryInitialState extends HistoryState{}

class HistoryLoading extends HistoryState{


}

class HistoryLoaded extends HistoryState{

  List<Map<String,dynamic>> data;
  HistoryLoaded({required this.data});


}