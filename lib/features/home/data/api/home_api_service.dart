import 'package:docdoc/features/home/data/api/home_api_constants.dart';
import 'package:retrofit/retrofit.dart';
  import 'package:dio/dio.dart' ;


import '../../../../core/networking/api_constants.dart';
import '../models/specializations_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}