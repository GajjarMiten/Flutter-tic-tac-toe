part of 'bord_bloc.dart';

@immutable
abstract class BordState {}

class BordInitial extends BordState {
  final List<int> bord = [55, 55, 55, 55, 55, 55, 55, 55, 55];
}

class UpdateBord extends BordState {
  final List<int> bordState;
  UpdateBord({@required this.bordState});
}

class GameResult extends BordState {
  final int result;
  final List<int> bordState;
  GameResult(this.bordState, {this.result});
}
