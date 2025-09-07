import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech_mobile/features/main/domain/entity/main_view_entity.dart';
import 'package:medtech_mobile/features/main/domain/repo/main_view_repo.dart';

part 'fetch_main_view_state.dart';

class FetchMainViewCubit extends Cubit<FetchMainViewState> {
  FetchMainViewCubit(this.mainViewRepo) : super(FetchMainViewInitial());
  final MainViewRepo mainViewRepo;

  Future<void> getMainView() async {
    emit(FetchMainViewLoading());
    final result = await mainViewRepo.getMainView();
    result.fold(
      (l) {
        emit(FetchMainViewFialure(errMessage: l.errMessage));
      },
      (r) {
        emit(FetchMainViewSucces(mainViewEntity: r));
      },
    );
  }
}
