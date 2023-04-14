import 'package:flutter/services.dart';

import '../models/restaurant_models.dart';

class RestaurantService {
  Future<List<Restaurant>> getDataRes() async {
    String dataRes = await rootBundle.loadString('assets/data/list_data.json');
    return restaurantFromJson(dataRes);
  }
}
