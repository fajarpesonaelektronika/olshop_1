import 'package:flutter/material.dart';
import 'package:olshop_1/presentation/pages/shopping_chart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customAppBar(context),
    );
  }

  Widget _customAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.green[400],
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                        hintText: 'Cari paket data',
                        hintStyle: TextStyle(fontSize: 16),
                        border: InputBorder.none
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10))
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.markunread,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingChartPage()));
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
