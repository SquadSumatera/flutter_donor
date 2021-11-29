import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key? key,
    required this.callback,
    required this.active,
    required this.svgSource,
    required this.label,
  }) : super(key: key);

  final VoidCallback callback;
  final bool active;
  final String svgSource;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: callback,
          iconSize: 27.0,
          icon: SvgPicture.asset(
            svgSource,
            color: active ? AppColor.cRed : AppColor.cGrey,
          ),
        ),
        Text(
          label,
          style: AppText.textExtraSmall.copyWith(
            height: 0,
            fontWeight: AppText.semiBold,
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
