import 'dart:async';

import 'package:async/async.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:portfolio/Features/home/domain/usecases/get_data_use_case.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

class PortfolioCubit extends HydratedCubit<PortfolioState> {
  final GetDataUseCase getDataUseCase;
  CancelableOperation? _getDataOperation;

  PortfolioCubit({required this.getDataUseCase}) : super(PortfolioState.init());

  bool _isDisposed = false;

  Future<void> getData() async {
    await _getDataOperation?.cancel();
    emit(state.copyWith(loading: RequestStatus.loading));

    _getDataOperation = CancelableOperation.fromFuture(
      getDataUseCase.call(
        isCancelled: () => _isDisposed,
      ),
    );
    if (_isDisposed) return;
    final res = await _getDataOperation!.value;

    if (res == null) return;

    res.fold((l) {
      emit(state.copyWith(loading: RequestStatus.error));
    }, (r) {
      emit(state.copyWith(loading: RequestStatus.success, data: r));
    });
  }

  @override
  PortfolioState? fromJson(Map<String, dynamic> json) {
    return PortfolioState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PortfolioState state) {
    return state.toJson(state);
  }

  void changeSection(HomeSection section) {
    if (state.section == section) return;
    emit(state.copyWith(section: section));
  }

  void changeCategory(ProjectCategory cat) {
    if (state.projectCategory == cat) return;
    emit(state.copyWith(projectCategory: cat));
  }

  @override
  Future<void> close() {
    _getDataOperation?.cancel();
    return super.close();
  }
}
