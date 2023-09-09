import 'package:collection/collection.dart';

class PricePoints {
  final double x;
  final double y;
  PricePoints({required this.x, required this.y});
}

List<PricePoints> get pricePoints {
  final data = <double>[2, 5, 6, 11, 8, 5, 7];
  return data
      .mapIndexed(
          ((index, element) => PricePoints(x: index.toDouble(), y: element)))
      .toList();
}
