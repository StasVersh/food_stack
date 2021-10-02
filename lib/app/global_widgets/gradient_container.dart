import 'package:flutter/widgets.dart';

class GradientContainer extends Container {
  GradientContainer({
    Key? key,
    child,
    alignment,
    required List<Color> colors,
  }) : super(
            key: key,
            child: child,
            alignment: alignment,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors)));
}
