import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_application_1/domain/Cart/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state.restaurentDetails == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              final restaurantDetails = state.restaurentDetails;
              final tableMenuList = restaurantDetails!.tableMenuList ?? [];
              final dishesList = tableMenuList[0].categoryDishes;
              final ValueNotifier<List<CartModel>> cartListNotifier =
                  ValueNotifier([]);
              return ListView.builder(
                itemCount: dishesList!.length,
                itemBuilder: (context, index) {
                  int dishQuanity = 1;
                  return ValueListenableBuilder(
                    valueListenable: cartListNotifier,
                    builder: (context, value, child) {
                      return Container(
                          width: double.infinity,
                          height: 240,
                          color: Colors.grey.shade200,
                          margin: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      dishesList[index].dishImage!,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                              Text('${dishesList[index].dishName}'),
                              Text('\$${dishesList[index].dishPrice}'),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (dishQuanity == 0) {
                                        return;
                                      }
                                      dishQuanity--;
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text('$dishQuanity'),
                                  IconButton(
                                    onPressed: () {
                                      dishQuanity++;
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Add to cart'))
                            ],
                          ));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
