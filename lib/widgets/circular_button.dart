
import 'package:flutter/material.dart';
import 'package:getx_bmi_curculator/app_constants/app-colors.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.child,
    @required this.onTap,
    this.buttonColor,
    this.constraints,
    this.shape,
    Key key,
  }) : super(key: key);

  final Color buttonColor;
  final VoidCallback onTap;
  final Widget child;
  final BoxConstraints constraints;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: constraints ??
        const  BoxConstraints(
            minHeight: 52.0,
            minWidth: 52.0,
          ),
      fillColor: buttonColor ?? AppColors.circleButtonColor,
      shape: shape ?? CircleBorder(),
      child: child,
    );
  }
}
