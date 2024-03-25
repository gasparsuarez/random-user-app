import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';

class UserContactInfo extends StatelessWidget {
  final UserEntity user;
  const UserContactInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomTile(
            title: 'EMAIL',
            children: [
              Text(
                user.email,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.04,
          ),
          _CustomTile(
            title: 'ADDRESS',
            children: [
              Text(
                '${user.location.street.number}, ${user.location.street.name}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _CustomTile({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '• $title',
              style: TextStyle(
                fontSize: context.aspectRatio * 32,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
