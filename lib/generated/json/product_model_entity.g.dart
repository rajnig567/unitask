import 'package:unitask/generated/json/base/json_convert_content.dart';
import 'package:unitask/models/product_model_entity.dart';

ProductModelEntity $ProductModelEntityFromJson(Map<String, dynamic> json) {
  final ProductModelEntity productModelEntity = ProductModelEntity();
  final List<ProductModelProducts>? products = (json['products'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ProductModelProducts>(e) as ProductModelProducts)
      .toList();
  if (products != null) {
    productModelEntity.products = products;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    productModelEntity.total = total;
  }
  final int? skip = jsonConvert.convert<int>(json['skip']);
  if (skip != null) {
    productModelEntity.skip = skip;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    productModelEntity.limit = limit;
  }
  return productModelEntity;
}

Map<String, dynamic> $ProductModelEntityToJson(ProductModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['products'] = entity.products?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['skip'] = entity.skip;
  data['limit'] = entity.limit;
  return data;
}

extension ProductModelEntityExtension on ProductModelEntity {
  ProductModelEntity copyWith({
    List<ProductModelProducts>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductModelEntity()
      ..products = products ?? this.products
      ..total = total ?? this.total
      ..skip = skip ?? this.skip
      ..limit = limit ?? this.limit;
  }
}

ProductModelProducts $ProductModelProductsFromJson(Map<String, dynamic> json) {
  final ProductModelProducts productModelProducts = ProductModelProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productModelProducts.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productModelProducts.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    productModelProducts.description = description;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    productModelProducts.category = category;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    productModelProducts.price = price;
  }
  final double? discountPercentage = jsonConvert.convert<double>(
      json['discountPercentage']);
  if (discountPercentage != null) {
    productModelProducts.discountPercentage = discountPercentage;
  }
  final double? rating = jsonConvert.convert<double>(json['rating']);
  if (rating != null) {
    productModelProducts.rating = rating;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    productModelProducts.stock = stock;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (tags != null) {
    productModelProducts.tags = tags;
  }
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    productModelProducts.brand = brand;
  }
  final String? sku = jsonConvert.convert<String>(json['sku']);
  if (sku != null) {
    productModelProducts.sku = sku;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    productModelProducts.weight = weight;
  }
  final ProductModelProductsDimensions? dimensions = jsonConvert.convert<
      ProductModelProductsDimensions>(json['dimensions']);
  if (dimensions != null) {
    productModelProducts.dimensions = dimensions;
  }
  final String? warrantyInformation = jsonConvert.convert<String>(
      json['warrantyInformation']);
  if (warrantyInformation != null) {
    productModelProducts.warrantyInformation = warrantyInformation;
  }
  final String? shippingInformation = jsonConvert.convert<String>(
      json['shippingInformation']);
  if (shippingInformation != null) {
    productModelProducts.shippingInformation = shippingInformation;
  }
  final String? availabilityStatus = jsonConvert.convert<String>(
      json['availabilityStatus']);
  if (availabilityStatus != null) {
    productModelProducts.availabilityStatus = availabilityStatus;
  }
  final List<ProductModelProductsReviews>? reviews = (json['reviews'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ProductModelProductsReviews>(
          e) as ProductModelProductsReviews).toList();
  if (reviews != null) {
    productModelProducts.reviews = reviews;
  }
  final String? returnPolicy = jsonConvert.convert<String>(
      json['returnPolicy']);
  if (returnPolicy != null) {
    productModelProducts.returnPolicy = returnPolicy;
  }
  final int? minimumOrderQuantity = jsonConvert.convert<int>(
      json['minimumOrderQuantity']);
  if (minimumOrderQuantity != null) {
    productModelProducts.minimumOrderQuantity = minimumOrderQuantity;
  }
  final ProductModelProductsMeta? meta = jsonConvert.convert<
      ProductModelProductsMeta>(json['meta']);
  if (meta != null) {
    productModelProducts.meta = meta;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    productModelProducts.images = images;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    productModelProducts.thumbnail = thumbnail;
  }
  return productModelProducts;
}

Map<String, dynamic> $ProductModelProductsToJson(ProductModelProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['category'] = entity.category;
  data['price'] = entity.price;
  data['discountPercentage'] = entity.discountPercentage;
  data['rating'] = entity.rating;
  data['stock'] = entity.stock;
  data['tags'] = entity.tags;
  data['brand'] = entity.brand;
  data['sku'] = entity.sku;
  data['weight'] = entity.weight;
  data['dimensions'] = entity.dimensions?.toJson();
  data['warrantyInformation'] = entity.warrantyInformation;
  data['shippingInformation'] = entity.shippingInformation;
  data['availabilityStatus'] = entity.availabilityStatus;
  data['reviews'] = entity.reviews?.map((v) => v.toJson()).toList();
  data['returnPolicy'] = entity.returnPolicy;
  data['minimumOrderQuantity'] = entity.minimumOrderQuantity;
  data['meta'] = entity.meta?.toJson();
  data['images'] = entity.images;
  data['thumbnail'] = entity.thumbnail;
  return data;
}

extension ProductModelProductsExtension on ProductModelProducts {
  ProductModelProducts copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    ProductModelProductsDimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductModelProductsReviews>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    ProductModelProductsMeta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductModelProducts()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..category = category ?? this.category
      ..price = price ?? this.price
      ..discountPercentage = discountPercentage ?? this.discountPercentage
      ..rating = rating ?? this.rating
      ..stock = stock ?? this.stock
      ..tags = tags ?? this.tags
      ..brand = brand ?? this.brand
      ..sku = sku ?? this.sku
      ..weight = weight ?? this.weight
      ..dimensions = dimensions ?? this.dimensions
      ..warrantyInformation = warrantyInformation ?? this.warrantyInformation
      ..shippingInformation = shippingInformation ?? this.shippingInformation
      ..availabilityStatus = availabilityStatus ?? this.availabilityStatus
      ..reviews = reviews ?? this.reviews
      ..returnPolicy = returnPolicy ?? this.returnPolicy
      ..minimumOrderQuantity = minimumOrderQuantity ?? this.minimumOrderQuantity
      ..meta = meta ?? this.meta
      ..images = images ?? this.images
      ..thumbnail = thumbnail ?? this.thumbnail;
  }
}

ProductModelProductsDimensions $ProductModelProductsDimensionsFromJson(
    Map<String, dynamic> json) {
  final ProductModelProductsDimensions productModelProductsDimensions = ProductModelProductsDimensions();
  final double? width = jsonConvert.convert<double>(json['width']);
  if (width != null) {
    productModelProductsDimensions.width = width;
  }
  final double? height = jsonConvert.convert<double>(json['height']);
  if (height != null) {
    productModelProductsDimensions.height = height;
  }
  final double? depth = jsonConvert.convert<double>(json['depth']);
  if (depth != null) {
    productModelProductsDimensions.depth = depth;
  }
  return productModelProductsDimensions;
}

Map<String, dynamic> $ProductModelProductsDimensionsToJson(
    ProductModelProductsDimensions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['width'] = entity.width;
  data['height'] = entity.height;
  data['depth'] = entity.depth;
  return data;
}

extension ProductModelProductsDimensionsExtension on ProductModelProductsDimensions {
  ProductModelProductsDimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) {
    return ProductModelProductsDimensions()
      ..width = width ?? this.width
      ..height = height ?? this.height
      ..depth = depth ?? this.depth;
  }
}

ProductModelProductsReviews $ProductModelProductsReviewsFromJson(
    Map<String, dynamic> json) {
  final ProductModelProductsReviews productModelProductsReviews = ProductModelProductsReviews();
  final int? rating = jsonConvert.convert<int>(json['rating']);
  if (rating != null) {
    productModelProductsReviews.rating = rating;
  }
  final String? comment = jsonConvert.convert<String>(json['comment']);
  if (comment != null) {
    productModelProductsReviews.comment = comment;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    productModelProductsReviews.date = date;
  }
  final String? reviewerName = jsonConvert.convert<String>(
      json['reviewerName']);
  if (reviewerName != null) {
    productModelProductsReviews.reviewerName = reviewerName;
  }
  final String? reviewerEmail = jsonConvert.convert<String>(
      json['reviewerEmail']);
  if (reviewerEmail != null) {
    productModelProductsReviews.reviewerEmail = reviewerEmail;
  }
  return productModelProductsReviews;
}

Map<String, dynamic> $ProductModelProductsReviewsToJson(
    ProductModelProductsReviews entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rating'] = entity.rating;
  data['comment'] = entity.comment;
  data['date'] = entity.date;
  data['reviewerName'] = entity.reviewerName;
  data['reviewerEmail'] = entity.reviewerEmail;
  return data;
}

extension ProductModelProductsReviewsExtension on ProductModelProductsReviews {
  ProductModelProductsReviews copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return ProductModelProductsReviews()
      ..rating = rating ?? this.rating
      ..comment = comment ?? this.comment
      ..date = date ?? this.date
      ..reviewerName = reviewerName ?? this.reviewerName
      ..reviewerEmail = reviewerEmail ?? this.reviewerEmail;
  }
}

ProductModelProductsMeta $ProductModelProductsMetaFromJson(
    Map<String, dynamic> json) {
  final ProductModelProductsMeta productModelProductsMeta = ProductModelProductsMeta();
  final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
  if (createdAt != null) {
    productModelProductsMeta.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
  if (updatedAt != null) {
    productModelProductsMeta.updatedAt = updatedAt;
  }
  final String? barcode = jsonConvert.convert<String>(json['barcode']);
  if (barcode != null) {
    productModelProductsMeta.barcode = barcode;
  }
  final String? qrCode = jsonConvert.convert<String>(json['qrCode']);
  if (qrCode != null) {
    productModelProductsMeta.qrCode = qrCode;
  }
  return productModelProductsMeta;
}

Map<String, dynamic> $ProductModelProductsMetaToJson(
    ProductModelProductsMeta entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['barcode'] = entity.barcode;
  data['qrCode'] = entity.qrCode;
  return data;
}

extension ProductModelProductsMetaExtension on ProductModelProductsMeta {
  ProductModelProductsMeta copyWith({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return ProductModelProductsMeta()
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..barcode = barcode ?? this.barcode
      ..qrCode = qrCode ?? this.qrCode;
  }
}