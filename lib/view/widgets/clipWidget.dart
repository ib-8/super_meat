import 'package:flutter/material.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';

class ClipWidget extends StatelessWidget {
  const ClipWidget({
    Key? key,
    required this.child,
    this.rTopRight = 50,
    this.rTopLeft = 50,
    this.rBottomRight = 50,
    this.rBottomLeft = 50,
  }) : super(key: key);

  final Widget child;
  final double rTopRight;
  final double rTopLeft;
  final double rBottomRight;
  final double rBottomLeft;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(rTopRight),
        topLeft: Radius.circular(rTopLeft),
        bottomRight: Radius.circular(rBottomRight),
        bottomLeft: Radius.circular(rBottomLeft),
      ),
      child: child,
    );
  }
}

class KcalWidget extends StatelessWidget {
  const KcalWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipWidget(
      rTopRight: 10,
      rBottomRight: 100,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        color: AppColor.green,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledText(
              'Kcal',
              color: Colors.white.withOpacity(0.5),
              size: 14,
            ),
            const SizedBox(width: 10),
            StyledText(
              product.kcal.toString(),
              color: Colors.white,
              weight: FontWeight.w600,
            ),
            const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }
}

class AdjustmentWidget extends StatelessWidget {
  const AdjustmentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipWidget(
      rTopRight: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        color: AppColor.adjusterColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 15),
            StyledText(
              'Weight',
              color: Colors.white.withOpacity(0.5),
              size: 14,
            ),
            const SizedBox(height: 15),
            const Icon(Icons.add),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: AppText(
                '500 gr.',
                color: Colors.white,
                weight: FontWeight.w700,
              ),
            ),
            const Icon(Icons.remove),
          ],
        ),
      ),
    );
  }
}
