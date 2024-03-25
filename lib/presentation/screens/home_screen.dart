import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/domain.dart';
import 'package:random_user_app/presentation/bloc/cubit/random_user_cubit.dart';
import 'package:random_user_app/presentation/widgets/widgets.dart';

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
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                children: [
                  const UserCard(),
                  FilledButton(
                    onPressed: () => context.read<RandomUserCubit>().getRandomUser(),
                    child: const Text('Get random user'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
