import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:portfolio/Features/home/domain/usecases/get_data_use_case.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

class PortfolioCubit extends HydratedCubit<PortfolioState> {
  final GetDataUseCase getDataUseCase;
  PortfolioCubit({required this.getDataUseCase}) : super(PortfolioState.init());

  Future<void> getData() async {
    emit(state.copyWith(loading: RequestStatus.loading));
    final res = await getDataUseCase.call();
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

    emit(
      state.copyWith(
        section: section,
      ),
    );
  }

  void changeCategory(ProjectCategory cat) {
    if (state.projectCategory == cat) return;

    emit(
      state.copyWith(
        projectCategory: cat,
      ),
    );
  }
}
