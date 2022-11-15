import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/domain/restaurent/model/restaurant_model.dart';

class CartModel {
  final CategoryDishes dishDetails;
  final int quanity;
  CartModel({required this.dishDetails,required  this.quanity});
}
