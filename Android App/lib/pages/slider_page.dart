import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../models/plant.dart';
import '../widgets/plant_item.dart';
import 'detail_page.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List<Plant> plants = [
    Plant(
      name: 'Samambaia',
      humidity: false,
      temperature: 0,
      luminosity: 0,
    ),
    Plant(
      name: 'Suculenta',
      humidity: false,
      temperature: 0,
      luminosity: 0,
    ),
    Plant(
      name: 'Orquidea',
      humidity: false,
      temperature: 0,
      luminosity: 0,
    ),
  ];

  onTap(int index) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(plant: plants[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '     EcoMonitor',
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 35,
          ),
        ),
        actions: [Image.asset('assets/images/logo.png')],
      ),
      body: Center(
        child: FlutterCarousel(
          options: CarouselOptions(
            autoPlay: false,
            showIndicator: true,
            slideIndicator: CircularWaveSlideIndicator(
              currentIndicatorColor: const Color(0xFF62BB63),
            ),
          ),
          items: plants
              .map(
                (plant) => GestureDetector(
                  onTap: () => onTap(plants.indexOf(plant)),
                  child: PlantItem(plant: plant),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
