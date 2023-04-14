import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/restaurant_models.dart';
import '../services/restaurant_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  void getDataRes() async {
    try {
      emit(RestaurantLoading());
      List<Restaurant> res = await RestaurantService().getDataRes();
      emit(RestaurantSucces(res));
    } catch (e) {
      emit(RestaurantFailed(e.toString()));
    }
  }
}
