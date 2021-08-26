import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:olshop_1/domain/entities/shopping_cart_entity.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartInitialState());

  Future<void> getAllShoppingCartItems() async {
    try {
      emit(ShoppingCartLoadingState());
      await Future.delayed(Duration(seconds: 5));
      emit(ShoppingCartLoadedState(shoppingChartItems: shoppingChartItems));
    } catch (e) {
      emit(ShoppingCartFailureState());
    }
  }

  Future<void> addQuantity(String id) async {
    try {
      final index =
          shoppingChartItems.indexWhere((element) => element.id == id);
      shoppingChartItems[index].quantity += 1;
      emit(ShoppingCartLoadedState(shoppingChartItems: shoppingChartItems));
    } catch (e) {
      emit(ShoppingCartFailureState());
    }
  }

  Future<void> subQuantity(String id) async {
    try {
      final index =
          shoppingChartItems.indexWhere((element) => element.id == id);
      if (shoppingChartItems[index].quantity > 1) {
        shoppingChartItems[index].quantity -= 1;
        emit(ShoppingCartLoadedState(shoppingChartItems: shoppingChartItems));
      }
    } catch (e) {
      emit(ShoppingCartFailureState());
    }
  }

  Future<void> deleteItemFromShoppingCart(String id) async {
    try {
      final index =
          shoppingChartItems.indexWhere((element) => element.id == id);
      shoppingChartItems.removeAt(index);
      emit(ShoppingCartLoadedState(shoppingChartItems: shoppingChartItems));
      // if (shoppingChartItems[index].quantity > 1) {
      //   shoppingChartItems[index].quantity -= 1;
      //   emit(ShoppingCartLoadedState(shoppingChartItems: shoppingChartItems));
      // }
    } catch (e) {
      emit(ShoppingCartFailureState());
    }
  }
}

List<ShoppingCartEntity> shoppingChartItems = [
  ShoppingCartEntity(
      id: '0',
      productName: 'Sepatu',
      seller: 'Toko Sepatu',
      location: 'Jakarta',
      imageUrl: 'assets/images/sepatu1.jpg',
      quantity: 1,
      price: 100000,
      note: 'warna merah'),
  ShoppingCartEntity(
      id: '1',
      productName: 'Arloji',
      seller: 'Toko Arloji',
      location: 'Surabaya',
      imageUrl: 'assets/images/arloji1.jpg',
      quantity: 1,
      price: 120000,
      note: 'warna hitam'),
  ShoppingCartEntity(
      id: '2',
      productName: 'Tas',
      seller: 'Toko Tas',
      location: 'Sidoarjo',
      imageUrl: 'assets/images/tas1.jpg',
      quantity: 1,
      price: 100000,
      note: 'warna hijau'),
  ShoppingCartEntity(
      id: '3',
      productName: 'Tas',
      seller: 'Toko Tas',
      location: 'Sidoarjo',
      imageUrl: 'assets/images/tas1.jpg',
      quantity: 1,
      price: 100000,
      note: 'warna hijau'),
  ShoppingCartEntity(
      id: '4',
      productName: 'Tas',
      seller: 'Toko Tas',
      location: 'Sidoarjo',
      imageUrl: 'assets/images/tas1.jpg',
      quantity: 1,
      price: 100000,
      note: 'warna hijau'),
  ShoppingCartEntity(
      id: '5',
      productName: 'Arloji',
      seller: 'Toko Arloji',
      location: 'Surabaya',
      imageUrl: 'assets/images/arloji1.jpg',
      quantity: 1,
      price: 120000,
      note: 'warna hitam'),
];
