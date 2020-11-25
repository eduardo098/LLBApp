class HomeRepository {
  String _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Home';
  }

  String get data => _data;
}