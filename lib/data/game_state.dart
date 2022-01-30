import 'dart:math';

import 'package:mighty_marks_kids/data/verse.dart';
import 'package:mighty_marks_kids/data/verse_list.dart';
import 'package:mighty_marks_kids/data/word.dart';

class GameState {
  /*
     This code creates a "Singleton".  Whenever I create the GameState, I will
     get the same instance.
   */
  static final GameState _instance = GameState._gameState();
  factory GameState() {
    return _instance;
  }
  GameState._gameState();

  // verse to be memorized
  Verse bibleVerse = Verse("Please select a Bible verse first!");
  // list of verses available
  VerseList verses = VerseList();

  // the words in the verse -- created by buildWords()
  List<Word> words = [];
  // the words that have been answered so far
  List<Word> answers = [];
  // the words in the word bank -- randomized by buildWords()
  List<Word> bank = [];

  // message to tell the user about right or wrong answers
  String message = "";
  // number of wrong guesses in a row
  int wrongGuesses = 0;
  // number of wrong guesses to guess before showing the right answer
  static const maxWrongGuessCount = 5;
  // marked true when all the answers are in
  bool isVerseComplete = false;

  // for 3-star tracking
  int totalWrongGuesses = 0;
  int totalHelps = 0;

  // the widgets listening to game state changes
  List<Function> acceptedCallbacks = [];

  listen(Function callback) {
    acceptedCallbacks.add(callback);
  }

  pickVerse(Verse newVerse) {
    bibleVerse = newVerse;
    buildWords();
    // hack for now.  Probably should remove the listeners on dispose
    acceptedCallbacks = [];
  }

  buildWords() {
    List<String> simpleWords = bibleVerse.text.split(" ");
    words = [];

    // build the word list with objects
    int index = 0;
    for(String word in simpleWords) {
      Word objWord = Word(word);
      objWord.index = index++;
      words.add(objWord);
    }
    // add the reference
    Word objWord = Word(bibleVerse.reference);
    objWord.index = index++;
    words.add(objWord);

    bank = [];
    List<Word> temp = List.from(words);
    while(temp.isNotEmpty) {
      // There is an issue with screen space.  The words may flow off the screen where the
      // user can't selected them.  As a result, I'm making sure that I'm picking one of the top 5 words
      // keeping them on screen by the time they are needed.
      int max = temp.length;
      int pickedIndex = -1;
      if(max > 5) max = 5;
      for(int x=0; x<max; x++) {
        if(temp[x].index < bank.length - 5) {
          pickedIndex = x;
          break;
        }
      }
      if(pickedIndex < 0) {
        pickedIndex = Random().nextInt(temp.length);
      }
      bank.add(temp.removeAt(pickedIndex));
    }

    answers = [];
    message = "";
    wrongGuesses = 0;
    isVerseComplete = false;
    totalWrongGuesses = 0;
    totalHelps = 0;
  }

  bool checkWord(Word word) {
    Word currentWord = words[answers.length];
    return (currentWord.word.toUpperCase() == word.word.toUpperCase());
  }

  acceptNextWord() {
    Word currentWord = words[answers.length];
    answers.add(currentWord);
    for(Word word in bank) {
      if(currentWord.word == word.word) {
        bank.remove(word);
        break;
      }
    }
    currentWord.guessed = true;
    message = "Good job, '${currentWord.word}' is right!";
    wrongGuesses = 0;
    if(answers.length == words.length) {
      isVerseComplete = true;
    }
    for(Function listener in acceptedCallbacks) {
      listener();
    }
  }

  wrongWord(Word attemptedWord) {
    Word currentWord = words[answers.length];

    wrongGuesses++;
    totalWrongGuesses++;
    if(wrongGuesses >= maxWrongGuessCount) {
      message = "No, not '${attemptedWord.word}', next is '${currentWord.word}'";
      totalHelps++;
    } else {
      message = "No, '${attemptedWord.word}' is not next";
    }
    for(Function listener in acceptedCallbacks) {
      listener();
    }
  }

  refreshVerseList() {
    verses = VerseList();
  }

  int get stars {
    if(isVerseComplete) {
      if(totalWrongGuesses == 0) {
        return 3;
      } else {
        if(totalHelps == 0) {
          return 2;
        }
      }
      return 1;
    }
    return 0;
  }

}