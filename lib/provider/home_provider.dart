import 'package:unitask/core.dart';

enum UIState {
  loading,
  success,
  error
}

class HomeProvider extends ChangeNotifier{
  final DataSource dataSource;
  HomeProvider({
    required this.dataSource,
  });

  String? _message;
  String? get message => _message;

  final List<ProductModelProducts> _productList = [];
  List<ProductModelProducts> get productList => _productList;

  UIState _uiState = UIState.loading;
  UIState get uiState => _uiState;

  Future<void> fetchProductData() async {
    try {
      final response = await dataSource.fetchProductData();
      _productList.addAll(response.products ?? []);
      _uiState = UIState.success;
      notifyListeners();
    } catch (error) {
      _uiState = UIState.error;
      _message = error.toString();
      notifyListeners();
    }
  }
}