import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/bloc/cubit/random_user_cubit.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<RandomUserCubit, RandomUserState>(
      builder: (context, state) {
        return Card(
          child: SizedBox(
            width: size.width * 0.90,
            height: size.height * 0.18,
            child: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (user) => _UserContent(user),
              error: (message) => Text(message),
            ),
          ),
        );
      },
    );
  }
}

class _UserContent extends StatelessWidget {
  final UserEntity user;
  const _UserContent(this.user);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.height * 0.14,
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    user.picture,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        );
                      }
                      return child;
                    },
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              SizedBox(
                width: size.width * 0.48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      user.fullLocation,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.email,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
