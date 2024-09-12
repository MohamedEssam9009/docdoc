import 'package:docdoc/core/helpers/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/models/specializations_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];
            // get doctors list from the first specialization by default
        getDoctorsList(specializationId: specializationsList?.first?.id);
        emit(HomeState.specializationsSuccess(specializationsList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationListId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found!')));
    }
  }

  /// Returns the list of doctors based on specialization id
  getDoctorsListBySpecializationListId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
