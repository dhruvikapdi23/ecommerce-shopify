class ShopifyStorage {
  String? categoryId;
  String? cursor = '';
  bool? hasNextPage = true;

  void setShopifyStorage(cursorValue, cateId, nextPage) {
    cursor = cursorValue;
    hasNextPage = nextPage;
    categoryId = cateId;
  }

  Map<String, dynamic> toJson() {
    return {
      'cursor': cursor,
      'categoryId': categoryId,
      'hasNextPage': hasNextPage,
    };
  }
}