import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olshop_1/presentation/bloc/cubit/shopping_cart_cubit/cubit/shopping_cart_cubit.dart';
import 'package:olshop_1/presentation/widgets/single_item_shopping_cart.dart';

class ShoppingChartPage extends StatefulWidget {
  const ShoppingChartPage({Key? key}) : super(key: key);
  @override
  _ShoppingChartPageState createState() => _ShoppingChartPageState();
}

class _ShoppingChartPageState extends State<ShoppingChartPage> {
  @override
  void initState() {
    BlocProvider.of<ShoppingCartCubit>(context).getAllShoppingCartItems();
    super.initState();
  }

// padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Keranjang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                builder: (context, shoppingCartState) {
                  if (shoppingCartState is ShoppingCartLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (shoppingCartState is ShoppingCartLoadedState) {
                    // print(shoppingCartState.shoppingChartItems.length);
                    return ListView.builder(
                        itemCount: shoppingCartState.shoppingChartItems.length,
                        itemBuilder: (context, index) {
                          return SingleItemShoppingCart(
                            item: shoppingCartState.shoppingChartItems[index],
                          );
                        });
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:olshop_1/presentation/bloc/cubit/shopping_cart_cubit/cubit/shopping_cart_cubit.dart';
// import 'package:olshop_1/presentation/widgets/single_item_shopping_cart.dart';

// class ShoppingChartPage extends StatefulWidget {
//   const ShoppingChartPage({Key? key}) : super(key: key);
//   @override
//   _ShoppingChartPageState createState() => _ShoppingChartPageState();
// }

// class _ShoppingChartPageState extends State<ShoppingChartPage> {
//   @override
//   void initState() {
//     BlocProvider.of<ShoppingCartCubit>(context).getAllShoppingCartItems();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.only(top: 30, left: 10, right: 10),
//         child: ListView(
//           children: [
//             Row(
//               children: [
//                 Icon(
//                   Icons.arrow_back,
//                   size: 30,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'Keranjang',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
//                 builder: (context, shoppingCartState) {
//                   if (shoppingCartState is ShoppingCartLoadingState) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (shoppingCartState is ShoppingCartLoadedState) {
//                     print(shoppingCartState.shoppingChartItems.length);
//                     return ListView.builder(
//                         itemCount: shoppingCartState.shoppingChartItems.length,
//                         itemBuilder: (context, index) {
//                           return SingleItemShoppingCart(
//                             item: shoppingCartState.shoppingChartItems[index],
//                           );
//                         });
//                   }
//                   return Container();
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 100,
//               child: Text('data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
