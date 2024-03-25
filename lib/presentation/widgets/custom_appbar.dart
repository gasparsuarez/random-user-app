import 'package:flutter/material.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final UserEntity user;

  ///
  /// Custom Appbar with user avatar
  ///
  const CustomAppBar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.30,
      color: Colors.teal,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: context.height * 0.14,
                  height: context.height * 0.14,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedImageAdapter(
                      url: user.picture,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: context.height * 0.04,
                    height: context.height * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.teal,
                        width: 4,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.teal,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: context.aspectRatio * 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}
