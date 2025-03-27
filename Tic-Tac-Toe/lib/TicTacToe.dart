import 'dart:io';

bool winner = false;
bool isxturn = true;
int movecount = 0;

List<String> Values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combinations = [
  '012',
  '048',
  '036',
  '147',
  '246',
  '258',
  '345',
  '678',
];
void main() {
  generate_board();
  get_cher();
}

bool check_combination(String combination, String check) {
  List<int> numbers =
      combination.split('').map((item) {
        return int.parse(item);
      }).toList();
  bool match = false;
  for (final item in numbers) {
    if (Values[item] == check) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

void check_winner(player) {
  for (final item in combinations) {
    bool combination_validity = check_combination(item, player);
    if (combination_validity == true) {
      print("${player} is the winner...");
      winner = true;
      break;
    }
  }
}

void get_cher() {
  print("choose number for ${isxturn == true ? "X" : "O"}");
  int number = int.parse(stdin.readLineSync()!);
  Values[number - 1] = isxturn ? "X" : "O";
  isxturn = !isxturn;
  movecount++;
  if (movecount == 9) {
    winner = true;
    print("Game Over"); //تعادل
  } else {
    generate_board();
  }
  check_winner('X');
  check_winner('O');
  if (winner == false) get_cher();
}

void generate_board() {
  print('Game   Board');
  print('|${Values[0]} | ${Values[1]} | ${Values[2]} |');
  print('|__|___|___|');
  print('|  |   |   |');
  print('|${Values[3]} | ${Values[4]} | ${Values[5]} |');
  print('|__|___|___|');
  print('|  |   |   |');
  print('|${Values[6]} | ${Values[7]} | ${Values[8]} |');
  print('|__|___|___|');
}
