import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/presentation.dart';

class LocationAndPhoneInfo extends StatelessWidget {
  final UserEntity user;
  const LocationAndPhoneInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 10,
            offset: const Offset(
              0,
              8,
            ),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconInformationItem(
              icon: Icons.location_on_outlined,
              children: [
                _CustomText('${user.location.city},'),
                _CustomText(user.location.country),
              ],
            ),
            IconInformationItem(
              icon: Icons.call,
              children: [
                _CustomText(user.phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///
/// Custom text for icon badges
///
class _CustomText extends StatelessWidget {
  final String text;
  const _CustomText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[500]!,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
