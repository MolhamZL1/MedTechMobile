import 'package:flutter/material.dart';

import 'widgets/GoogleMapViewBody.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});
  static const routeName = "/googleMapView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GoogleMapViewBody());
  }
}
