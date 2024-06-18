import 'package:bus_app/screens/bus.dart';
import 'package:flutter/material.dart';

class BusCard extends StatelessWidget {
  final Bus bus;

  BusCard({required this.bus});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            bus.imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('Ruta: ${bus.route}'),
                Text('Información adicional: ${bus.additionalInfo}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}