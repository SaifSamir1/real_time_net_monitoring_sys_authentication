


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../data/models/card_item.dart';

class ServicesCarousel extends StatelessWidget {
  final List<CardItem> items;

  const ServicesCarousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.85,
      ),
      items: items.map((item) {
        return Builder(
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: item.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.number.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
