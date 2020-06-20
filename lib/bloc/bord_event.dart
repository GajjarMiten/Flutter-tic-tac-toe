part of 'bord_bloc.dart';

@immutable
abstract class BordEvent {}

class Tap extends BordEvent {
  final int index;
  Tap({@required this.index});
}
