import 'package:myuwi/Layout/Adaptive.dart';
import 'package:myuwi/Values/AppValues.dart';
import 'package:myuwi/Widgets/AppCustomPainters.dart';
import 'package:flutter/material.dart';

enum AppTearDropAlignment { topLeft, topRight, bottomLeft, bottomRight }

class AppTearDropButton extends StatelessWidget {
  AppTearDropButton({
    @required this.buttonText,
    this.radius,
    this.tearDropAlignment = AppTearDropAlignment.topRight,
    this.buttonTextStyle,
    this.color = AppColors.orangeShade6,
    this.style = PaintingStyle.fill,
    this.onTap,
    this.elevation = AppSizes.ELEVATION_8,
    this.hasShadow = false,
    this.shadowColor,
  });

  final double radius;
  final Color color;
  final AppTearDropAlignment tearDropAlignment;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final PaintingStyle style;
  final GestureTapCallback onTap;
  final bool hasShadow;
  final double elevation;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    double defaultRadius = assignHeight(context: context, fraction: 0.07);
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        height: (defaultRadius ?? radius) * 2,
        width: (defaultRadius ?? radius) * 2,
        child: Stack(
          children: [
            Container(
              height: (defaultRadius ?? radius) * 2,
              width: (defaultRadius ?? radius) * 2,
              child: CustomPaint(
                painter: AppDrawTearDrop(
                    color: color,
                    offset: Offset(
                      defaultRadius ?? radius,
                      defaultRadius ?? radius,
                    ),
                    elevation: elevation,
                    shadowColor: shadowColor,
                    hasShadow: hasShadow,
                    paintingStyle: style,
                    radius: defaultRadius ?? radius,
                    tearDropAlignment: tearDropAlignment),
              ),
            ),
            Container(
              height: (defaultRadius ?? radius) * 2,
              width: (defaultRadius ?? radius) * 2,
              child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle ??
                      theme.textTheme.bodyText1.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
