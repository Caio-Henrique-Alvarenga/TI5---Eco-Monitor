import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    String imgPath = '';

    switch (plant.name) {
      case 'Samambaia':
        imgPath = 'assets/images/samambaia.png';
        break;
      case 'Suculenta':
        imgPath = 'assets/images/suculenta.png';
        break;
      case 'Orquidea':
        imgPath = 'assets/images/orquidea.png';
        break;
      default:
        imgPath = 'assets/images/logo.png';
        break;
    }

    return Container(
      width: 275,
      height: 430,
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset(imgPath),
          if (plant.name == 'Orquidea') const SizedBox(height: 55),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF62BB63),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              plant.name,
              style: const TextStyle(
                fontFamily: 'Mulish',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
