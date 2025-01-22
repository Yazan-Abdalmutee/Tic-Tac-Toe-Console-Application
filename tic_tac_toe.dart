import 'dart:io';

void main() {
  int currentPlayerTurn; // turn number
  String currentPlayerSymbol; // (O) or (X)
  bool exitOfGame = false;
  List<List<String>> gameBoard;
  while (exitOfGame != true) {
    currentPlayerTurn = 1;
    currentPlayerSymbol = ' ';
    gameBoard = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ];
    while (true) {
      displayBoard(gameBoard);

      // Determine current player's symbol (X or O)
      currentPlayerSymbol = (currentPlayerTurn % 2 == 1) ? 'X' : 'O';
      // Prompt current player for input
      int cellNumber = getPlayerInput(currentPlayerTurn, currentPlayerSymbol);
      cellNumber -= 1;
      int row = cellNumber ~/ 3;
      int col = cellNumber % 3;

      // Check if the cell is not used
      if (gameBoard[row][col] != 'X' && gameBoard[row][col] != 'O') {
        gameBoard[row][col] = currentPlayerSymbol;
        currentPlayerTurn++;
      } else {
        print("\nThis cell is already taken. Please choose another.");
      }

      // Check if the game is finished
      if (checkIfGameIsOver(gameBoard)) {
        break;
      }

      // If all spots are used, it's a draw
      if (currentPlayerTurn >= 10) {
        displayBoard(gameBoard);
        print('\n===========================\n');
        print("\nIt's a draw!\n");
        print('\n===========================\n');
        break;
      }
      print(
          '\n*****************************************************************');
    }
    print("");
    // Keep asking until the user enters a valid response
    exitOfGame = promptReplay();
  }
}
// Function to display the current state of the game board
void displayBoard(List<List<String>> board) {
  print("\nCurrent Game Board:\n");
  for (int i = 0; i < 3; i++) {
    print(" ${board[i][0]} | ${board[i][1]} | ${board[i][2]} ");
    if (i < 2) {
      print("---+---+---");
    }
  }
  print("");
}

// Function to get valid input from the current player
int getPlayerInput(int currentPlayerTurn, String currentPlayerSymbol) {
  while (true) {
    currentPlayerTurn = (currentPlayerTurn % 2 == 1) ? 1 : 2;
    stdout.write(
        "Player $currentPlayerTurn ($currentPlayerSymbol), Enter a number from 1-9: ");
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty && int.tryParse(input) != null) {
      int number = int.parse(input);
      if (number >= 1 && number <= 9) {
        return number; 
      }
    }
    print("\nInvalid input. Please enter a number between 1 and 9.\n");
  }
}

// Function to check if the game is finished and display the winner 
bool checkIfGameIsOver(List<List<String>> board) {
  String winner = getWinner(board);
  if (winner != "") {
    displayBoard(board);
    print('\n===========================\n');
    if (winner == "X") {
      print("\nPlayer 1 wins! (X)\n");
    } else if (winner == "O") {
      print("\nPlayer 2 wins! (O)\n");
    }
    print('\n===========================\n');
    return true;
  }
  return false;
}

// Function to check if there is a winner after each player play 
String getWinner(List<List<String>> board) {
  // Check rows and columns
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
      return board[i][0]; // Winner in row
    }
    if (board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
      return board[0][i]; // Winner in column
    }
  }

  // Check diagonals
  if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    return board[0][0]; // Winner in diagonal 1
  }
  if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
    return board[0][2]; // Winner in diagonal 2
  }

  return ""; // No winner yet
}
// Function to prompt the user to replay or exit the game
bool promptReplay() {
  while (true) {
    stdout.write(
        "\nDo you want to play another round? If yes, enter 1; if no, enter 0: ");
    String? input = stdin.readLineSync();

    if (input == '1') {
      return false;
    } else if (input == '0') {
      print('\n!! Quit !! \n');
      return true;
    } else {
      print("\nInvalid input. Please enter 1 or 0.\n");
    }
  }
}
