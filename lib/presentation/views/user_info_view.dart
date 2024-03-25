import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/widgets/widgets.dart';

class UserInfoView extends StatelessWidget {
  final UserEntity user;
  const UserInfoView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            user: user,
          ),
          LocationAndPhoneInfo(
            user: user,
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          UserContactInfo(
            user: user,
          ),
        ],
      ),
    );
  }
}
