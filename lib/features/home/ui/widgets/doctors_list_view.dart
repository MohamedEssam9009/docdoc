import 'package:docdoc/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/specializations_response_model.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;

  const DoctorsListView({super.key,  this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItems(doctorsModel: doctorsList?[index]);
        },
      ),
    );
  }
}