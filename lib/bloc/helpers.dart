import 'dart:math';

int checkWinner(List<int> bord) {
  if (checkSumRow(bord) == 0 ||
      checkSumColumn(bord) == 0 ||
      checkSumDigonal(bord) == 0) {
    return 1;
  }
  if (checkSumRow(bord) == 3 ||
      checkSumColumn(bord) == 3 ||
      checkSumDigonal(bord) == 3) {
    return -1;
  }
  if (checkSumOfBord(bord) < 9 && checkSumOfBord(bord) > 3) {
    return 0;
  }
  return null;
}

int checkSumRow(List<int> bord) {
  int value;

  for (int i = 0; i < 7; i += 3) {
    value = 0;
    bord.getRange(i, i + 3).forEach((element) => value += element);
    if (value == 0 || value == 3) {
      break;
    }
  }

  return value;
}

int checkSumOfBord(List<int> bord) {
  int value = 0;

  bord.forEach((element) => value += element);
  return value;
}

int checkSumColumn(List<int> bord) {
  int value;
  for (int i = 0; i < 3; i++) {
    value = bord[i] + bord[i + 3] + bord[i + 6];

    if (value == 0 || value == 3) {
      break;
    }
  }
  return value;
}

int checkSumDigonal(List<int> bord) {
  int value;
  int value1;
  int value2;
  value1 = bord[0] + bord[4] + bord[8];
  value2 = bord[2] + bord[4] + bord[6];
  if (value1 == 0 || value2 == 0) {
    value = 0;
  } else if (value1 == 3 || value2 == 3) {
    value = 3;
  } else {
    value = 55;
  }
  return value;
}

// Minimax Algo for the best move

int minimax(List<int> bord, int depth, bool isMaximizing) {
  if (checkWinner(bord) != null) {
    return checkWinner(bord);
  }
  if (isMaximizing) {
    int bestScore = 55;
    for (int i = 0; i < 9; i++) {
      if (bord[i] != 0 && bord[i] != 1) {
        bord[i] = 1;
        int score = minimax(bord, depth + 1, false);
        bord[i] = 55;
        bestScore = min(score, bestScore);
      }
    }

    return bestScore;
  } else {
    int bestScore = -55;
    for (int i = 0; i < 9; i++) {
      if (bord[i] != 0 && bord[i] != 1) {
        bord[i] = 0;
        int score = minimax(bord, depth + 1, true);
        bord[i] = 55;
        bestScore = max(score, bestScore);
      }
    }

    return bestScore;
  }
}



