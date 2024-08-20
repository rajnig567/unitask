import 'package:unitask/generated/json/base/json_field.dart';
import 'package:unitask/generated/json/product_model_entity.g.dart';
import 'dart:convert';
export 'package:unitask/generated/json/product_model_entity.g.dart';

@JsonSerializable()
class ProductModelEntity {
	List<ProductModelProducts>? products = [];
	int? total = 0;
	int? skip = 0;
	int? limit = 0;

	ProductModelEntity();

	factory ProductModelEntity.fromJson(Map<String, dynamic> json) => $ProductModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProductModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductModelProducts {
	int? id = 0;
	String? title = '';
	String? description = '';
	String? category = '';
	double? price;
	double? discountPercentage;
	double? rating;
	int? stock = 0;
	List<String>? tags = [];
	String? brand = '';
	String? sku = '';
	int? weight = 0;
	ProductModelProductsDimensions? dimensions;
	String? warrantyInformation = '';
	String? shippingInformation = '';
	String? availabilityStatus = '';
	List<ProductModelProductsReviews>? reviews = [];
	String? returnPolicy = '';
	int? minimumOrderQuantity = 0;
	ProductModelProductsMeta? meta;
	List<String>? images = [];
	String? thumbnail = '';

	ProductModelProducts();

	factory ProductModelProducts.fromJson(Map<String, dynamic> json) => $ProductModelProductsFromJson(json);

	Map<String, dynamic> toJson() => $ProductModelProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductModelProductsDimensions {
	double? width;
	double? height;
	double? depth;

	ProductModelProductsDimensions();

	factory ProductModelProductsDimensions.fromJson(Map<String, dynamic> json) => $ProductModelProductsDimensionsFromJson(json);

	Map<String, dynamic> toJson() => $ProductModelProductsDimensionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductModelProductsReviews {
	int? rating = 0;
	String? comment = '';
	String? date = '';
	String? reviewerName = '';
	String? reviewerEmail = '';

	ProductModelProductsReviews();

	factory ProductModelProductsReviews.fromJson(Map<String, dynamic> json) => $ProductModelProductsReviewsFromJson(json);

	Map<String, dynamic> toJson() => $ProductModelProductsReviewsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductModelProductsMeta {
	String? createdAt = '';
	String? updatedAt = '';
	String? barcode = '';
	String? qrCode = '';

	ProductModelProductsMeta();

	factory ProductModelProductsMeta.fromJson(Map<String, dynamic> json) => $ProductModelProductsMetaFromJson(json);

	Map<String, dynamic> toJson() => $ProductModelProductsMetaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}