import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/domain/restaurent/model/restaurant_model.dart';

import 'package:flutter_application_1/domain/restaurent/restaurant_service.dart';
import 'package:flutter_application_1/infrastructure/restaurant_repository.dart';
import 'package:meta/meta.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    RestaurantRepository restaurantRepository = RestaurantRepository();
    on<getRestaurantDetailsEvent>((event, emit) async {
      final restaurantData = await restaurantRepository.getRestaurantDetails();
      emit(RestaurantState(restaurentDetails: restaurantData));
    });
  }
}
