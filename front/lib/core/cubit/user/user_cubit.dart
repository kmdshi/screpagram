import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:screpagram/core/domain/models/person_entity.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<PersonEntity?> {
  UserCubit() : super(null);

  void setUser(PersonEntity user) => emit(user);
  void updateUser(PersonEntity newUser) => emit(newUser);
  void clearUser() => emit(null);

  @override
  PersonEntity? fromJson(Map<String, dynamic> json) {
    try {
      return PersonEntity.fromMap(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PersonEntity? state) {
    return state?.toMap();
  }
}
