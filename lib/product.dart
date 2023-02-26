class Product {
  final String name;
  final int id;

  Product({required this.name, required this.id});
}

class ProductRepository {
  List<Product> getProducts() {
    return [
      Product(name: 'Car 1', id: 0),
      Product(name: 'Car 2', id: 0),
      Product(name: 'Bike 1', id: 1),
      Product(name: 'Bike 2', id: 1),
      Product(name: 'Boat', id: 0),
      Product(name: 'Plane', id: 1),
    ];
  }
}
