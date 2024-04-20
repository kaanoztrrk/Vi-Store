import 'package:flutter/material.dart';

import 'curved_edges.dart';

class ViCurvedEdgeWidget extends StatelessWidget {
  const ViCurvedEdgeWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: ViCustomCurvedEdges(), child: child);
  }
}
