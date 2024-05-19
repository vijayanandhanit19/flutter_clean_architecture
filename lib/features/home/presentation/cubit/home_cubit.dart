import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/home_data.dart';
import '../../data/repository/home_repository_impl.dart';
import '../../domain/usecases/get_home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  GetHomeUsecase getHomeUsecase = GetHomeUsecase(HomeRepositoryImpl());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    var result = await getHomeUsecase.execute();
    result.fold(
      (failure) {
        emit(HomeError(failure.message));
      },
      (data) {
        emit(HomeLoaded(data));
      },
    );
  }
}
