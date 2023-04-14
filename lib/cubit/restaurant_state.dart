part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantSucces extends RestaurantState {
  final List<Restaurant> res;

  const RestaurantSucces(this.res);

  @override
  List<Object?> get props => [res];
}

class RestaurantFailed extends RestaurantState {
  final String error;

  const RestaurantFailed(this.error);

  @override
  List<Object?> get props => [error];
}
