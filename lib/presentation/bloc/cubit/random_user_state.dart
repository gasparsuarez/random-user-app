part of 'random_user_cubit.dart';

@freezed
class RandomUserState with _$RandomUserState {
  const factory RandomUserState.initial() = _Initial;
  const factory RandomUserState.loading() = _Loading;
  const factory RandomUserState.loaded(UserEntity user) = _Loaded;
  const factory RandomUserState.error(String error) = _Error;
}
