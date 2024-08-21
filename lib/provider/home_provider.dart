import 'dart:convert';
import 'dart:developer';

import 'package:unitask/core.dart';

enum UIState { loading, success, error }

class HomeProvider extends ChangeNotifier {
  final DataSource dataSource;

  HomeProvider({
    required this.dataSource,
  });

  String? _message;
  String? get message => _message;

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;

  late List<ProductModelProducts> _productList = [];
  List<ProductModelProducts> get productList => _productList;

  Map<String, List<ProductModelProducts>> _categorizedProductList = {};
  Map<String, List<ProductModelProducts>> get categorizedProductList =>
      _categorizedProductList;

  final Map<int, List<ProductModelProducts>> _cartList = {};
  Map<int, List<ProductModelProducts>> get cartList => _cartList;

  // late List<String> _productTagsList = [];
  // List<String> get productTagList => _productTagsList;
  final Map<String, List<ProductModelProducts>> _productTagsList = {};
  Map<String, List<ProductModelProducts>> get productTagList => _productTagsList;

  late List<String> _selectedProductTagsList = [];
  List<String> get selectedProductTagList => _selectedProductTagsList;

  UIState _uiState = UIState.loading;
  UIState get uiState => _uiState;

  late double _cartTotal = 0.0;
  double get cartTotal => _cartTotal;

  Future<void> fetchProductData() async {
    try {
      final ProductModelEntity response = await dataSource.fetchProductData();
      _productList.addAll(response.products ?? []);
      filterAllTags(products: _productList);
      _categorizedProductList = _productList.groupBy((e) => e.category ?? '');
      _selectedCategory = _categorizedProductList.keys.first;
      _productList = _categorizedProductList[_selectedCategory] ?? [];
      _uiState = UIState.success;
      notifyListeners();
    } catch (error) {
      _uiState = UIState.error;
      _message = error.toString();
      notifyListeners();
    }
  }

  void filterAllTags({required List<ProductModelProducts> products}) {
    for (ProductModelProducts i in products) {
      for(String j in i.tags ?? []){
        List<ProductModelProducts> list = _productTagsList[j] ?? [];
        list.add(i);
        _productTagsList[j] = list;
      }
    }
  }

  void displayProductsByCategory({required String category}) {
    _selectedCategory = category;
    clearTagSelection();
    notifyListeners();
  }

  void addToCart({required ProductModelProducts product}) {
    List<ProductModelProducts> list = _cartList[product.id ?? 0] ?? [];
    list.add(product);
    _cartList[product.id ?? 0] = list;
    _cartTotal += product.price ?? 0;
    notifyListeners();
  }

  void removeSingleProductFromCart({required ProductModelProducts product}) {
    List<ProductModelProducts> list = _cartList[product.id ?? 0] ?? [];
    list.remove(product);
    _cartList[product.id ?? 0] = list;
    _cartTotal -= product.price ?? 0;
    notifyListeners();
  }

  void removeProductFromCart({required ProductModelProducts product}) {
    _cartList.remove(product.id ?? 0);
    countTotal();
    notifyListeners();
  }

  void countTotal() {
    double total = 0.0;
    for (var i in _cartList.values) {
      double sum =
          i.map((e) => e.price).fold(0.0, (prev, next) => prev + (next ?? 0));
      total += sum;
    }
    _cartTotal = total;
  }

  void updateTagSelection({required String tag}) {
    if (_selectedProductTagsList.contains(tag)) {
      _selectedProductTagsList.remove(tag);
    } else {
      _selectedProductTagsList.add(tag);
    }
    notifyListeners();
  }

  void clearTagSelection() {
    _selectedProductTagsList.clear();
    _productList = _categorizedProductList[_selectedCategory] ?? [];
    notifyListeners();
  }

  void applyTagFilter(){
    List<ProductModelProducts> list = [];
    for(var i in _categorizedProductList[_selectedCategory] ?? []){
      for(var tag in selectedProductTagList){
        if(i.tags?.contains(tag) ?? false){
          list.add(i);
        }
      }
    }
    _productList = list.toSet().toList();
    notifyListeners();
  }
}
