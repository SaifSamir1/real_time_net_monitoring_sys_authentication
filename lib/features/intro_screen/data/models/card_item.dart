




import 'package:flutter/material.dart';

class CardItem {
  final int number;
  final String title;
  final String description;
  final Color backgroundColor;

  CardItem({
    required this.number,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

final List<CardItem> cardItems = [
  CardItem(
    number: 1,
    title: 'Smart Savings',
    description:
    'This is the space to introduce the Services section. Briefly describe the types of services offered and highlight any special benefits or features.',
    backgroundColor: Colors.black,
  ),
  CardItem(
    number: 2,
    title: 'Digital Wallet',
    description:
    'This is the space to introduce the Services section.\n'
        'Briefly describe the types of services offered and highlight any special benefits or features.',
    backgroundColor: Color(0xFFBDBDFF),
  ),
  CardItem(
    number: 3,
    title: 'Crypto Exchange',
    description:
    'This is the space to introduce the Services section.\n'
        'Briefly describe the types of services offered and highlight any special benefits or features.',
    backgroundColor: Colors.black,
  ),
  CardItem(
    number: 2,
    title: 'Digital Wallet',
    description:
    'This is the space to introduce the Services section.\n'
        ' Briefly describe the types of services offered and highlight any special benefits or features.',
    backgroundColor: Color(0xFFBDBDFF),
  ),
  // Add more items as needed
];
