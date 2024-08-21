class Category {
  String? name;
  String? id;
  Category.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    id = data['id'];
  }
}
