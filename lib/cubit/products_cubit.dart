import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test1/product.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<List<Product>> {

  final ProductRepository _repository = ProductRepository();

  ProductCubit() : super([]);

  void getProducts() {
    emit(_repository.getProducts());
  }

  void filterProducts(int id) {
    emit(_repository.getProducts().where((p) => p.id == id).toList());
  }
}