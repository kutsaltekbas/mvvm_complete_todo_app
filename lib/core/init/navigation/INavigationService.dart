abstract class INavigationService {
  Future<void> navigateToPage({required String path, required Object object});
  Future<void> navigateToPageClear({required String path, required Object object});

}
