part of 'restaurant_bloc.dart';

class RestaurantState {
  final RestaurentModel? restaurentDetails;

  RestaurantState({required this.restaurentDetails});
}

class RestaurantInitial extends RestaurantState {
  RestaurantInitial() : super(restaurentDetails: null);
}
