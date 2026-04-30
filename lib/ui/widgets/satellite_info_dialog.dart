import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sat/state/providers.dart';

class SatelliteInfoDialog extends ConsumerWidget {
  const SatelliteInfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final satellite = ref.watch(selectedSatelliteProvider);

    if (satellite == null) {
      return const AlertDialog(
        title: Text('Error'),
        content: Text('No satellite selected.'),
      );
    }

    return AlertDialog(
      title: Text(satellite.label),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            _buildInfoRow('NORAD ID:', '${satellite.tle.noradCatId}'),
            _buildInfoRow('Inclination:', '${satellite.tle.inclination}°'),
            _buildInfoRow('RAAN:', '${satellite.tle.raan}°'),
            _buildInfoRow('Eccentricity:', '${satellite.tle.eccentricity}'),
            _buildInfoRow(
              'Arg of Perigee:',
              '${satellite.tle.argumentOfPerigee}°',
            ),
            _buildInfoRow('Mean Anomaly:', '${satellite.tle.meanAnomaly}°'),
            _buildInfoRow(
              'Mean Motion:',
              '${satellite.tle.meanMotion} revs/day',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
