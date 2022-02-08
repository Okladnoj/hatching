class BaseTestItem {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  BaseTestItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class TestMultipleItems extends BaseTestItem {
  final List<BaseTestItem> items;

  TestMultipleItems({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required this.items,
  }) : super(
          id: id,
          description: description,
          imageUrl: imageUrl,
          name: name,
        );
}

class TestSingleItem extends BaseTestItem {
  final String testJson;

  TestSingleItem({
    required this.testJson,
    required String id,
    required String name,
    required String description,
    required String imageUrl,
  }) : super(
          id: id,
          description: description,
          imageUrl: imageUrl,
          name: name,
        );
}
