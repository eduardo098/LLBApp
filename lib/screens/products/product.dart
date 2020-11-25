class Product {
  int id;
  String name;
  String description;
  String price;
  String image;
  int cantidad;
  String comentarios;
  List<int> extras;


  Product({
    this.id, 
    this.name, 
    this.description, 
    this.price, 
    this.image,
    this.cantidad,
    this.comentarios,
    this.extras});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}

class ProductResponse {
  final List<Product> products;
  final String error;

  ProductResponse(this.products, this.error);

  
  ProductResponse.fromJson(Map<String, dynamic> json)
    : products = (json["result"] as List).map((i) => new Product.fromJson(i)).toList(),
  error = "";

  ProductResponse.withError(String errorValue)
    : products = List(),
    error = errorValue;
}

class OrderProduct {
  int id;
  int cantidad;
  String comentarios;
  List<int> extras;
  double total;

  OrderProduct({
    this.id, 
    this.cantidad,
    this.comentarios,
    this.extras,
    this.total
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.cantidad;
    data['instructions'] = this.comentarios;
    data['id_product'] = this.id;
    data['toppings'] = this.extras;
    return data;
  }
}