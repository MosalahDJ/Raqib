import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/product_list.dart';
import '../../view%20model/settings%20controllers/language_controller.dart';

class ProductsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController animationController;
  late Animation<double> animation;

  // Selected product for detail view
  Rx<Product?> selectedProduct = Rx<Product?>(null);

  // Observable list for product categories that will update with language changes
  final Rx<List<ProductCategory>> _productCategories =
      Rx<List<ProductCategory>>([]);

  // Getter for the translated product categories
  List<ProductCategory> get productCategories => _productCategories.value;

  // Language controller reference
  late LanguageController _languageController;

  @override
  void onInit() {
    super.onInit();

    // Initialize animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    // Get language controller
    _languageController = Get.find<LanguageController>();

    // Update products when language changes
    ever(_languageController.language, (_) => _updateProductsWithLanguage());

    // Initial load of products with current language
    _updateProductsWithLanguage();
  }

  // Update products based on current language
  void _updateProductsWithLanguage() {
    final currentLanguage = _languageController.language.value;
    _productCategories.value = ProductList.getTranslatedCategories(
      currentLanguage,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void showProductDetails(Product product) {
    selectedProduct.value = product;
    animationController.forward();
  }

  void hideProductDetails() {
    animationController.reverse().then((_) {
      selectedProduct.value = null;
    });
  }
}
