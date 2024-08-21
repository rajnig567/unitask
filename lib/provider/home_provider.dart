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

  final Map<int, List<ProductModelProducts>> _cartList = {};
  Map<int, List<ProductModelProducts>> get cartList => _cartList;

  UIState _uiState = UIState.loading;
  UIState get uiState => _uiState;

  late double _cartTotal = 0.0;
  double get cartTotal => _cartTotal;

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

  void addToCart({required ProductModelProducts product}){
    List<ProductModelProducts> list = _cartList[product.id ?? 0] ?? [];
    list.add(product);
    _cartList[product.id ?? 0] = list;
    _cartTotal+= product.price ?? 0;
    notifyListeners();
  }

  void removeSingleProductFromCart({required ProductModelProducts product}){
    List<ProductModelProducts> list = _cartList[product.id ?? 0] ?? [];
    list.remove(product);
    _cartList[product.id ?? 0] = list;
    _cartTotal-= product.price ?? 0;
    notifyListeners();
  }

  void removeProductFromCart({required ProductModelProducts product}){
    _cartList.remove(product.id ?? 0);
    countTotal();
    notifyListeners();
  }
  
  void countTotal(){
    double total = 0.0;
    for(var i in _cartList.values){
      double sum = i.map((e) => e.price).fold(0.0, (prev, next) => prev + (next ?? 0));
      total+=sum;
    }
    _cartTotal = total;
  }
}