import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_user_app/core/core.dart';
import 'package:random_user_app/domain/entities/user_entity.dart';
import 'package:random_user_app/domain/repositories/user_repository.dart';

part 'random_user_state.dart';
part 'random_user_cubit.freezed.dart';

class RandomUserCubit extends Cubit<RandomUserState> {
  final UserRepository _repository;
  RandomUserCubit(this._repository) : super(const RandomUserState.initial());

  void getRandomUser() async {
    emit(const RandomUserState.loading());
    final data = await _repository.getRandomUser();
    data.fold(
      (failure) => emit(
        RandomUserState.error(Handlers.failureToStringMessage(failure)),
      ),
      (user) => emit(RandomUserState.loaded(user)),
    );
  }
}
