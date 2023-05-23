import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lockers/config/constants.dart';

part 'lockers_state.dart';

class LockersCubit extends Cubit<LockersState> {
  LockersCubit()
      : super(LockersState(
          lockers: [],
          isLoaded: false,
        ));

  final dio = Dio();

  getLockers() async {
    List<Locker> lockers = [];
    try {
      Response response = await dio.get("$apiUrl''");
      response.data['lockers'].forEach((locker) {
        Locker item = Locker.fromJson(locker);
        lockers.add(item);
      });
      state.lockers = lockers;
      state.isLoaded = true;
      emit(state.copyWith(lockers: state.lockers, isLoaded: state.isLoaded));
      return response;
    } catch (e) {
      state.isLoaded = true;
      emit(state.copyWith(lockers: state.lockers, isLoaded: state.isLoaded));
      throw Exception(e);
    }
  }

  toggleLocker(int index, bool value) {
    state.lockers[index].isLock = value;
    emit(state.copyWith(lockers: state.lockers));
  }
}
