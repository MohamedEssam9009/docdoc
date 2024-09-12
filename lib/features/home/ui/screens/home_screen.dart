import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_specialty_see_all.dart';
import 'package:docdoc/features/home/ui/widgets/specialization_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../widgets/doctors_list/doctors_bloc_builder.dart';
import '../widgets/doctors_blue_container.dart';
import '../widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorSpecialtySeeAll(),
              verticalSpace(18),
              const SpecializationsBlocBuilder(),
              verticalSpace(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
