abstract class DetailsEvent{
}

class AdoptEvent extends DetailsEvent{
  String id;
  AdoptEvent(this.id);
}