import 'package:flutter/material.dart';
import '../models/plant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.plant}) : super(key: key);
  final Plant plant;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://testeesp01arduino-default-rtdb.firebaseio.com/.json'),
    );

    final data = json.decode(response.body);

    final dataHumidity = !data['Solo Seco'];
    final dataTemperature = data['Temperatura'];
    final dataLuminosity = data['Intensidade UV'];

    setState(() {
      widget.plant.humidity = dataHumidity;
      widget.plant.temperature = dataTemperature;
      widget.plant.luminosity = dataLuminosity;
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  isHumidityGood() {
    bool isGood = false;

    if (widget.plant.name == 'Samambaia') {
      if (widget.plant.humidity) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Suculenta') {
      if (widget.plant.humidity) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Orquidea') {
      if (widget.plant.humidity) {
        isGood = true;
      } else {
        isGood = false;
      }
    }

    return isGood;
  }

  isTemperatureGood() {
    bool isGood = false;

    if (widget.plant.name == 'Samambaia') {
      if (widget.plant.temperature >= 20 && widget.plant.temperature <= 38) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Suculenta') {
      if (widget.plant.temperature >= 17 && widget.plant.temperature <= 22) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Orquidea') {
      if (widget.plant.temperature >= 15 && widget.plant.temperature <= 35) {
        isGood = true;
      } else {
        isGood = false;
      }
    }

    return isGood;
  }

  isLuminosityGood() {
    bool isGood = false;

    if (widget.plant.name == 'Samambaia') {
      if (widget.plant.luminosity >= 30 && widget.plant.luminosity <= 60) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Suculenta') {
      if (widget.plant.luminosity >= 40 && widget.plant.luminosity <= 70) {
        isGood = true;
      } else {
        isGood = false;
      }
    } else if (widget.plant.name == 'Orquidea') {
      if (widget.plant.luminosity >= 50 && widget.plant.luminosity <= 80) {
        isGood = true;
      } else {
        isGood = false;
      }
    }

    return isGood;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 110, left: 46, right: 46),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.plant.name,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const Text(
              'Overview',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14,
                color: Color(0xFF767272),
              ),
            ),
            const SizedBox(height: 30),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: isHumidityGood()
                              ? const Color(0xFF62BB63)
                              : const Color(0xFFEB5555),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Humidade',
                              style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: isTemperatureGood()
                              ? const Color(0xFF62BB63)
                              : const Color(0xFFEB5555),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.thermostat,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Temperatura',
                              style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 90),
                            Text(
                              '${(widget.plant.temperature).toStringAsFixed(0)}ºC',
                              style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                          color: isLuminosityGood()
                              ? const Color(0xFF62BB63)
                              : const Color(0xFFEB5555),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.thermostat,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Luminosidade',
                              style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 80),
                            Text(
                              '${(widget.plant.luminosity).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 50),
            isLoading
                ? const SizedBox()
                // : ElevatedButton(
                //     onPressed: fetchData,
                //     child: const Text('Recarregar'),
                //   ),
                : Center(
                    child: GestureDetector(
                      onTap: () => fetchData(),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF62BB63),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Recarregar',
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
