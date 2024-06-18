import 'package:bus_app/screens/bus_card.dart';
import 'package:flutter/material.dart';
import 'bus.dart';

class BusSearch extends SearchDelegate<String> {
  final List<Bus> buses;

  BusSearch({required this.buses});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, ''));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = buses.where((bus) => bus.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return BusCard(bus: results[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = buses.where((bus) => bus.name.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            close(context, suggestions[index].name);
          },
        );
      },
    );
  }
}