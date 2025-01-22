# Tic Tac Toe Game in Dart

This is a simple command-line Tic Tac Toe game implemented in Dart. The game allows two players to take turns, playing as `X` and `O`, on a 3x3 grid. The first player to get three of their symbols in a row, column, or diagonal wins. If all cells are filled without a winner, the game ends in a draw.

## Features

- Supports two-player gameplay.
- Validates user input to ensure valid moves.
- Detects the winner or a draw condition.
- Allows replaying the game or exiting after each round.

## Gameplay Instructions

1. The game alternates turns between Player 1 (`X`) and Player 2 (`O`).
2. On your turn:
   - Enter a number between `1-9` to place your symbol on the corresponding cell:
     ```
      1 | 2 | 3
     ---+---+---
      4 | 5 | 6
     ---+---+---
      7 | 8 | 9
     ```
   - If the cell is already taken, you'll be asked to choose a different cell.
3. The game checks for a winner after each turn. If all cells are filled without a winner, it's a draw.
4. After the game ends, you can choose to replay or exit:
   - Enter `1` to play another round.
   - Enter `0` to quit the game.

## Example Gameplay

```text
Current Game Board:

 1 | 2 | 3 
---+---+---
 4 | 5 | 6 
---+---+---
 7 | 8 | 9 

Player 1 (X), Enter a number from 1-9: 1

Current Game Board:

 X | 2 | 3 
---+---+---
 4 | 5 | 6 
---+---+---
 7 | 8 | 9 

Player 2 (O), Enter a number from 1-9: 5


## How to Run

1. **Install Dart**: Make sure Dart is installed on your system. You can download Dart from [dart.dev](https://dart.dev/get-dart).
2. **Save the File**: Copy the game code into a file named `tic_tac_toe.dart`.
3. **Run the Game**:
   - Open a terminal or command prompt.
   - Navigate to the directory where the `tic_tac_toe.dart` file is saved.
   - Execute the game with the command:
     ```bash
     dart run tic_tac_toe.dart
...
     ```
