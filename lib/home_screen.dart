import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/cubit/products_cubit.dart';
import 'package:test1/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = context.read<ProductCubit>();
    _productCubit.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productCubit = context.watch<ProductCubit>();

    return Scaffold(
      appBar: AppBar(
        title:const Text('Product List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductCubit, List<Product>>(
              builder: (context, products) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].name),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(

                onPressed: () {
                  productCubit.filterProducts(0);
                },
                child:const Text('Filter by ID 0'),
              ),
              ElevatedButton(
                onPressed: () {
                  productCubit.filterProducts(1);
                },
                child:const Text('Filter by ID 1'),
              ),


            ],
          ),
        ],
      ),
    );
  }
}