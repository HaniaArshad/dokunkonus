import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../model/card_model.dart';

class HomeViewModel extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  RxList<CardModel> foodData = <CardModel>[].obs;
  RxList<int> selectedIndices = <int>[].obs;

  Future<void> playVoices(String data) async {
    await flutterTts.speak(data);
    await Future.delayed(const Duration(seconds: 1));
  }

  playVoiceOnTap() async {
    for (int selectedIndex in selectedIndices) {
      var selectedCardModel = foodData[selectedIndex];
      playVoices(selectedCardModel.cardText);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void removeSelectedCard(int index) {
    selectedIndices.remove(index);
    update();
  }

  Future<void> fetchFoodData() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("foodCard").get();

      foodData.value = snapshot.docs
          .map((doc) => CardModel(
                cardText: doc['name'],
                imagePath: doc['image'],
              ))
          .toList();
    }on FirebaseException catch (e, r) {
      log("Error fetching food data: $e");
      log("Error fetching food data: $r");
    }
  }

  deleteIconOnTap() {
    if (selectedIndices.isNotEmpty) {
      selectedIndices.removeLast();
    }
  }
}
