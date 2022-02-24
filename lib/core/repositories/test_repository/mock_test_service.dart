import 'package:hatching/data/repositories/test_repository.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';

class MockTestsService implements TestsRepository {
  @override
  Future<List<BaseTestItem>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      TestSingleItem(
        testJson: "testJson",
        id: "1",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestSingleItem(
        testJson: "testJson",
        id: "2",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestSingleItem(
        testJson: "testJson",
        id: "3",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestMultipleItems(
        id: "4",
        name: "Test List",
        description: "description",
        imageUrl: "https://picsum.photos/200",
        items: [
          TestSingleItem(
            testJson: "testJson",
            id: "5",
            name: "Test",
            description: "description",
            imageUrl: "https://picsum.photos/200",
          ),
          TestSingleItem(
            testJson: "testJson",
            id: "6",
            name: "Test",
            description: "description",
            imageUrl: "https://picsum.photos/200",
          ),
        ],
      )
    ];
  }

  @override
  Future<List<BaseTestItem>> fetchSearchResults(String query) async {
    return [
      TestSingleItem(
        testJson: "testJson",
        id: "1",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestSingleItem(
        testJson: "testJson",
        id: "2",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestSingleItem(
        testJson: "testJson",
        id: "3",
        name: "Test",
        description: "description",
        imageUrl: "https://picsum.photos/200",
      ),
      TestMultipleItems(
        id: "4",
        name: "Test List",
        description: "description",
        imageUrl: "https://picsum.photos/200",
        items: [
          TestSingleItem(
            testJson: "testJson",
            id: "5",
            name: "Test",
            description: "description",
            imageUrl: "https://picsum.photos/200",
          ),
          TestSingleItem(
            testJson: "testJson",
            id: "6",
            name: "Test",
            description: "description",
            imageUrl: "https://picsum.photos/200",
          ),
        ],
      )
    ];
  }

  @override
  Future<BaseTestItem> fetchTestItemById(String id) async {
    return TestSingleItem(
      testJson: "testJson",
      id: id,
      name: "Test",
      description: "description",
      imageUrl: "https://picsum.photos/200",
    );
  }

  @override
  Future<TestSingleItem> fetchTestDetailsById(String id) async {
    return TestSingleItem(
      testJson: "testJson",
      id: id,
      name: "Test",
      description: "description",
      imageUrl: "https://picsum.photos/200",
    );
  }
}
