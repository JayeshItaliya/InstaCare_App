import 'package:flutter/cupertino.dart';
import 'package:instacare/Utils/appColor.dart';


class CommonContainer extends StatefulWidget {
  double? height;
  double? width;
  Widget? child;
  CommonContainer({Key? key, this.child}) : super(key: key);

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16)
      ),
      child: widget.child,
    );
  }
}
