import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/core/api_end_points.dart';
import 'package:flutter_application_1/domain/restaurent/model/restaurant_model.dart';
import 'package:flutter_application_1/domain/restaurent/restaurant_service.dart';

class RestaurantRepository extends RestaurantService {
  final RestaurentModel restaurentModel = RestaurentModel();
  @override
  Future<RestaurentModel> getRestaurantDetails() async {
    final res = await Dio(BaseOptions()).get(ApiEndPoints.apiUri);
    final restaurentData = RestaurentModel.fromJson(res.data );
    return restaurentData;
  }
}
