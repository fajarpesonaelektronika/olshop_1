import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olshop_1/domain/entities/shopping_cart_entity.dart';
import 'package:intl/intl.dart';
import 'package:olshop_1/presentation/bloc/cubit/shopping_cart_cubit/cubit/shopping_cart_cubit.dart';

class SingleItemShoppingCart extends StatelessWidget {
  final ShoppingCartEntity item;
  const SingleItemShoppingCart({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      // height: 100,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amber,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0.5, 0),
              blurRadius: 1.0,
              spreadRadius: 0.0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Transform.scale(
                  scale: 1.2,
                  child: Checkbox(value: false, onChanged: (value) {})),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.seller}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${item.location}'),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.scale(
                  scale: 1.2,
                  child: Checkbox(value: false, onChanged: (value) {})),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(item.imageUrl), fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.productName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(NumberFormat("#,##0.00", "en_US").format(item.price),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Tulis Catatan',
                style: TextStyle(color: Colors.green[500]),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text('Pindahkan ke Whishlist')),
              InkWell(
                onTap: () {
                  BlocProvider.of<ShoppingCartCubit>(context)
                      .deleteItemFromShoppingCart(item.id);
                },
                child: Icon(
                  Icons.delete,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                // width: 50,
                height: 30,
                decoration: BoxDecoration(border: Border.all(width: 0.1)),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          BlocProvider.of<ShoppingCartCubit>(context)
                              .subQuantity(item.id);
                        },
                        child: Icon(Icons.remove)),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                        onTap: () {
                          BlocProvider.of<ShoppingCartCubit>(context)
                              .addQuantity(item.id);
                        },
                        child: Icon(Icons.add)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
