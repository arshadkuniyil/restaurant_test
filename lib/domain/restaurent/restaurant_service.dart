import 'package:flutter_application_1/domain/restaurent/model/restaurant_model.dart';

abstract class RestaurantService {
  Future<RestaurentModel> getRestaurantDetails();
}
