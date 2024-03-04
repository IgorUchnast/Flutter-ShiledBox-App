import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shield_box/models/user_models.dart';

class UserCubit extends Cubit<User> {
  UserCubit(super.initialState);
  void emitUser(user) => emit(user);
}
