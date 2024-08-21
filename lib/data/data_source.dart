import 'package:unitask/core.dart';

class DataSource{

  Future<ProductModelEntity> fetchProductData() async {
    try {
      final response = await APIProvider.instance.getAPICall(APIConstants.products);
      return ProductModelEntity.fromJson(response.data);
    } on DioException catch (error) {
      throw Exception(error);
    }
  }
}