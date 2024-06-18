import 'package:bus_app/screens/bus.dart';
import 'package:flutter/material.dart';

class BusSearchDelegate extends SearchDelegate<String> {
  final List<Bus> buses;

  BusSearchDelegate(this.buses);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      close(context, ""); // Puedes devolver una cadena vacía o cualquier otro valor no nulo
    },
  );
}


  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final List<Bus> filteredList = buses
        .where((bus) =>
            bus.name.toLowerCase().contains(query.toLowerCase()) ||
            bus.route.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredList[index].name),
          subtitle: Text(filteredList[index].route),
          onTap: () {
            close(context, filteredList[index].name);
          },
        );
      },
    );
  }
}
