class OrderProducts {
  String folio;
  String user;
  String state;
  String total;
  String delivery;
  String address;
  List<Products> products;

  OrderProducts(
      {this.folio,
        this.user,
        this.state,
        this.total,
        this.delivery,
        this.address,
        this.products});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    folio = json['folio'];
    user = json['user'];
    state = json['state'];
    total = json['total'];
    delivery = json['delivery'];
    address = json['address'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['folio'] = this.folio;
    data['user'] = this.user;
    data['state'] = this.state;
    data['total'] = this.total;
    data['delivery'] = this.delivery;
    data['address'] = this.address;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String amount;
  String instructions;
  String image;
  String product;
  String toppings;

  Products(
      {this.amount,
        this.instructions,
        this.image,
        this.product,
        this.toppings});

  Products.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    instructions = json['instructions'];
    image = json['image'];
    product = json['product'];
    toppings = json['toppings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['instructions'] = this.instructions;
    data['image'] = this.image;
    data['product'] = this.product;
    data['toppings'] = this.toppings;
    return data;
  }
}

class OrderDetailsResponse {
  final List<OrderProducts> orders;
  final String error;

  OrderDetailsResponse(this.orders, this.error);


  OrderDetailsResponse.fromJson(Map<String, dynamic> json)
      : orders = (json["order"] as List).map((i) => new OrderProducts.fromJson(i)).toList(),
        error = "";

  OrderDetailsResponse.withError(String errorValue)
      : orders = List(),
        error = errorValue;
}
