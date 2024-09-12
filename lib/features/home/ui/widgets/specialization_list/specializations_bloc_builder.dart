import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
import 'specialty_list_view.dart';
import 'specialty_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeMap(
          specializationsLoading: (value) => setupLoading(),
          specializationsSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialtyShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialtyListView(
      specializationDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
