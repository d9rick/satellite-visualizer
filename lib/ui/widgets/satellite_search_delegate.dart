import 'package:flutter/material.dart';
import 'package:flutter_sat/domain/satellite/models/satellite.dart';

class SatelliteSearchDelegate extends SearchDelegate<SatelliteEntity?> {
  final List<SatelliteEntity> satellites;

  SatelliteSearchDelegate({required this.satellites});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = satellites
        .where((s) => s.label.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final satellite = results[index];
        return ListTile(
          title: Text(satellite.label),
          onTap: () {
            close(context, satellite);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = satellites
        .where((s) => s.label.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final satellite = results[index];
        return ListTile(
          title: Text(satellite.label),
          onTap: () {
            query = satellite.label;
            showResults(context);
          },
        );
      },
    );
  }
}
