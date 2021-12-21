import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallet_manager/constant/constant.dart';

class BouncePoint extends StatelessWidget {
  final double size;
  const BouncePoint({Key key, this.size = 64}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size,
      color: mainColor,
      duration: duration,
    );
  }
}
