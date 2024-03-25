import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'HOME_SCREEN';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomUserCubit(getIt.get<UserRepository>()),
      child: BlocBuilder<RandomUserCubit, RandomUserState>(
        builder: (context, state) {
          return Scaffold(
            body: state.when(
              initial: () => const Center(
                child: Text(
                  'Tap button for generate new random user',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (UserEntity user) => UserInfoView(
                user: user,
              ),
              error: (String error) => Center(
                child: Text(error),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  context.aspectRatio * 14,
                ),
              ),
              onPressed: () => context.read<RandomUserCubit>().getRandomUser(),
              label: const Text(
                'Random User',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
