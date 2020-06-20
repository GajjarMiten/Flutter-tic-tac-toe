import 'dart:async';
import 'dart:math';

import '../bloc/helpers.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bord_event.dart';
part 'bord_state.dart';

class BordBloc extends Bloc<BordEvent, BordState> {
  List<int> _bordState = [55, 55, 55, 55, 55, 55, 55, 55, 55];
  bool playerOneTurn = true;
  int currentMove = 0;
  int winner;
  int difficultyLevel;
  bool isPlayer2Bot = false;

  List<int> get getBordState => _bordState;

  @override
  BordInitial get initialState => BordInitial();

  @override
  Stream<BordState> mapEventToState(
    BordEvent event,
  ) async* {
    if (event is Tap) {
      updateBord(event.index);
      winner = checkWinner(_bordState);
      if (winner != null) {
        yield GameResult(_bordState, result: winner);
      } else
        yield UpdateBord(bordState: _bordState);
    }
  }

  void updateBord(int index) {
    if (playerOneTurn && _bordState[index] != 1 && _bordState[index] != 0) {
      _bordState[index] = 0;
      playerOneTurn = false;
      if (isPlayer2Bot && checkWinner(_bordState) != 1) {
        switch (difficultyLevel) {
          case 0:
            easyBot();
            break;
          case 1:
            mediumBot();
            break;
          case 2:
            hardBot();
            break;
          default:
            easyBot();
        }
        playerOneTurn = true;
      }
    } else if (_bordState[index] != 0 &&
        _bordState[index] != 1 &&
        !isPlayer2Bot) {
      _bordState[index] = 1;
      playerOneTurn = true;
    }
    currentMove++;
  }

  void hardBot() {
    int bestScore = 55;
    int move;

    for (int i = 0; i < 9; i++) {
      if (_bordState[i] != 0 && _bordState[i] != 1) {
        _bordState[i] = 1;
        int score = minimax(_bordState, 0, false);
        _bordState[i] = 55;
        if (score < bestScore) {
          bestScore = score;
          move = i;
        }
      }
    }
    if (move != null) _bordState[move] = 1;
  }

  void easyBot() {
    int move = Random().nextInt(9);
    bool isPlayed = false;
    while (!isPlayed) {
      if (_bordState[move] != 0 && _bordState[move] != 1) {
        _bordState[move] = 1;
        isPlayed = true;
      } else {
        move = Random().nextInt(9);
      }
    }
  }

  void mediumBot() {
    bool luck = false;
    luck = Random().nextBool();
    if (luck && currentMove <9) {
      hardBot();
    } else {
      easyBot();
    }
  }
}
