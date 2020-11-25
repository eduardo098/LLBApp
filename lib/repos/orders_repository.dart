class OrdersRepository {
  String _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Orders';
  }

  String get data => _data;
}