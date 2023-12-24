class CategoriesDataModel {
  final List<CategoryModelItem> data;

  CategoriesDataModel({required this.data});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = json['data'];
    List<CategoryModelItem> categoryItems =
    dataList.map((item) => CategoryModelItem.fromJson(item)).toList();

    return CategoriesDataModel(data: categoryItems);
  }
}

class CategoryModelItem {
  final int id;
  final String name;
  final String image;

  CategoryModelItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModelItem.fromJson(Map<String, dynamic> json) {
    return CategoryModelItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
