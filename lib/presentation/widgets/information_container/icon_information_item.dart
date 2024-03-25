import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';

class IconInformationItem extends StatelessWidget {
  final IconData icon;
  final List<Widget> children;
  const IconInformationItem({
    super.key,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  size: context.aspectRatio * 70,
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          Expanded(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
