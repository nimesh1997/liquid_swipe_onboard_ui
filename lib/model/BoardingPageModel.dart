import 'package:flutter/material.dart';

class BoardingPageModel {
  String headline;
  String descLine;
  String image;
  Color color;
  Color textColor;

  BoardingPageModel(this.headline, this.descLine, this.image, this.color, this.textColor);
}

List pages = [
  BoardingPageModel('Ready to Travel', 'Choose your destination, plan your ticket.Pick the best place for your holiday', 'assets/images/mountain.png',
      Colors.indigo, Colors.white),
  BoardingPageModel('Select the Date', 'Select the day, pick your ticket, we give you the best price. We guaranted!', 'assets/images/world.png',
      Colors.yellow, Colors.black),
  BoardingPageModel(
      'Feels Like Home', 'Enjoys your holidays! Dont forget to \ntake a photo!', 'assets/images/home.png', Colors.deepOrange, Colors.white),
];
