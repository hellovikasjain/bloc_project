import '../../Home/Data/dog_modal.dart';

abstract class DetailsEvent{
}

class AdoptEvent extends DetailsEvent{
  DogListModal data;
  AdoptEvent(this.data);
}