import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallet_online/app/config/constants/app_constant.dart';
import 'package:wallet_online/app/config/themes/app_theme.dart';

class BouncePoint extends StatelessWidget {
  final bool? state;
  final double size;
  final Color? color;

  const BouncePoint({
    Key? key,
    this.state,
    this.size = 64,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case true:
        return SpinKitThreeBounce(
          size: size,
          color: color ?? AppTheme.mainColor,
          duration: AppConstant.durationSplash,
        );
      case false:
        return Center(
          child: SpinKitCubeGrid(
            size: size,
            color: color ?? AppTheme.mainColor,
            duration: AppConstant.durationSplash,
          ),
        );
      default:
        return SpinKitSquareCircle(
          size: size,
          color: color ?? AppTheme.mainColor,
          duration: AppConstant.durationSplash,
        );
    }
  }
}
