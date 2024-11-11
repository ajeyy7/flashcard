import 'package:flashcard/model/card_model.dart';
import 'package:flutter/material.dart';

class FlashCardViewModel extends ChangeNotifier {
  final List<FlashCard> cards = [
  

    FlashCard(word: "Obvio", meaning: "Obvious"),
    FlashCard(word: "Amicable", meaning: "Friendly"),
    FlashCard(word: "Serendipity", meaning: "Finding something good without looking for it"),

    FlashCard(word: "Obvio", meaning: "Obvious"),
    FlashCard(word: "Amicable", meaning: "Friendly"),
    FlashCard(word: "Serendipity", meaning: "Finding something good without looking for it"),

    FlashCard(word: "Obvio", meaning: "Obvious"),
    FlashCard(word: "Amicable", meaning: "Friendly"),
    FlashCard(word: "Serendipity", meaning: "Finding something good without looking for it"),

    FlashCard(word: "Obvio", meaning: "Obvious"),
    FlashCard(word: "Amicable", meaning: "Friendly"),
    FlashCard(word: "Serendipity", meaning: "Finding something good without looking for it"),
    
    FlashCard(word: "Obvio", meaning: "Obvious"),
    FlashCard(word: "Amicable", meaning: "Friendly"),
    FlashCard(word: "Serendipity", meaning: "Finding something good without looking for it"),
  ];

  int currentIndex = 0;
  bool isFlipped = false;



  void goToNextCard() {
    if (currentIndex < cards.length - 1) {
      currentIndex++;
      isFlipped = false;
      notifyListeners();
    }
  }

  void goToPreviousCard() {
    if (currentIndex > 0) {
      currentIndex--;
      isFlipped = false;
      notifyListeners();
    }
  }


}
