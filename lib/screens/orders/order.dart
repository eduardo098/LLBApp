class Order {
  String orden;
  String cliente;
  String state;
  String total;
  String direccion;
  String fecha;

  Order(
      {this.orden,
        this.cliente,
        this.state,
        this.total,
        this.direccion,
        this.fecha});

  Order.fromJson(Map<String, dynamic> json) {
    orden = json['orden'];
    cliente = json['cliente'];
    state = json['state'];
    total = json['total'];
    direccion = json['direccion'];
    fecha = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orden'] = this.orden;
    data['cliente'] = this.cliente;
    data['state'] = this.state;
    data['total'] = this.total;
    data['dirección'] = this.direccion;
    data['fecha'] = this.fecha;
    return data;
  }
}

class OrderResponse {
  final List<Order> orders;
  final String error;

  OrderResponse(this.orders, this.error);


  OrderResponse.fromJson(Map<String, dynamic> json)
      : orders = (json["orders"] as List).map((i) => new Order.fromJson(i)).toList(),
        error = "";

  OrderResponse.withError(String errorValue)
      : orders = List(),
        error = errorValue;
}
