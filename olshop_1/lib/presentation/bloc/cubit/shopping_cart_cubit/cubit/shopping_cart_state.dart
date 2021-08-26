part of 'shopping_cart_cubit.dart';

@immutable
abstract class ShoppingCartState {}

class ShoppingCartInitialState extends ShoppingCartState {}

class ShoppingCartLoadingState extends ShoppingCartState {}

class ShoppingCartLoadedState extends ShoppingCartState {
  final List<ShoppingCartEntity> shoppingChartItems;

  ShoppingCartLoadedState({required this.shoppingChartItems});
}

class ShoppingCartFailureState extends ShoppingCartState {}
