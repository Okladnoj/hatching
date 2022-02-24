import 'package:json_annotation/json_annotation.dart';

part 'test_item.cg.g.dart';

class BaseTestItem {
  @JsonKey()
  final String id;
  @JsonKey()
  final String name;
  @JsonKey()
  final String description;
  @JsonKey()
  final String imageUrl;

  BaseTestItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

@JsonSerializable()
class TestMultipleItems extends BaseTestItem {
  @JsonKey()
  final List<TestSingleItem> items;

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

  static TestMultipleItems fromJson(Map<String, dynamic> json) =>
      _$TestMultipleItemsFromJson(json);
}

@JsonSerializable()
class TestSingleItem extends BaseTestItem {
  @JsonKey()
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

  static TestSingleItem fromJson(Map<String, dynamic> json) =>
      _$TestSingleItemFromJson(json);
}
