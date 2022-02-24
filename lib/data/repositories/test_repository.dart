import 'package:hatching/domain/test_item/test_item.cg.dart';

abstract class TestsRepository {
  Future<List<BaseTestItem>> fetchItems();

  Future<List<BaseTestItem>> fetchSearchResults(String query);

  Future<BaseTestItem> fetchTestItemById(String id);

  Future<TestSingleItem> fetchTestDetailsById(String id);
}
