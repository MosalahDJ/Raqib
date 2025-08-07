import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final bool subsidized;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.subsidized,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'subsidized': subsidized,
      'description': description,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      subsidized: map['subsidized'],
      description: map['description'],
      image: map['image'],
    );
  }
}

class ProductCategory {
  final String name;
  final IconData icon;
  final Color color;
  final List<Product> products;

  ProductCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon,
      'color': color,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }
}

// French translations for products
class ProductTranslationFr {
  static Map<String, String> productNames = {
    'Wheat Flour': 'Farine de Blé',
    'Semolina': 'Semoule',
    'Rice': 'Riz',
    'Milk': 'Lait',
    'Yogurt': 'Yaourt',
    'Vegetable Oil': 'Huile Végétale',
    'Olive Oil': 'Huile d\'Olive',
    'White Sugar': 'Sucre Blanc',
    'Lentils': 'Lentilles',
    'Chickpeas': 'Pois Chiches',
  };

  static Map<String, String> productDescriptions = {
    'Government subsidized wheat flour for bread making':
        'Farine de blé subventionnée par le gouvernement pour la fabrication du pain',
    'Essential for couscous and traditional Algerian dishes':
        'Essentiel pour le couscous et les plats traditionnels algériens',
    'Imported rice with government price controls':
        'Riz importé avec contrôle des prix par le gouvernement',
    'Pasteurized milk with government price controls':
        'Lait pasteurisé avec contrôle des prix par le gouvernement',
    'Local yogurt production with partial subsidies':
        'Production locale de yaourt avec subventions partielles',
    'Cooking oil with strict price controls':
        'Huile de cuisson avec contrôle strict des prix',
    'Premium Algerian olive oil with partial price support':
        'Huile d\'olive algérienne premium avec soutien partiel des prix',
    'Refined sugar with government price controls':
        'Sucre raffiné avec contrôle des prix par le gouvernement',
    'Imported lentils with price controls':
        'Lentilles importées avec contrôle des prix',
    'Essential legume for Algerian cuisine':
        'Légumineuse essentielle pour la cuisine algérienne',
  };

  static String getProductName(String englishName) {
    return productNames[englishName] ?? englishName;
  }

  static String getProductDescription(String englishDescription) {
    return productDescriptions[englishDescription] ?? englishDescription;
  }
}

// Arabic translations for products
class ProductTranslationAr {
  static Map<String, String> productNames = {
    'Wheat Flour': 'دقيق القمح',
    'Semolina': 'سميد',
    'Rice': 'أرز',
    'Milk': 'حليب',
    'Yogurt': 'زبادي',
    'Vegetable Oil': 'زيت نباتي',
    'Olive Oil': 'زيت زيتون',
    'White Sugar': 'سكر أبيض',
    'Lentils': 'عدس',
    'Chickpeas': 'حمص',
  };

  static Map<String, String> productDescriptions = {
    'Government subsidized wheat flour for bread making':
        'دقيق القمح المدعوم من الحكومة لصناعة الخبز',
    'Essential for couscous and traditional Algerian dishes':
        'ضروري للكسكس والأطباق الجزائرية التقليدية',
    'Imported rice with government price controls':
        'أرز مستورد مع ضوابط حكومية للأسعار',
    'Pasteurized milk with government price controls':
        'حليب مبستر مع ضوابط حكومية للأسعار',
    'Local yogurt production with partial subsidies':
        'إنتاج محلي للزبادي مع دعم جزئي',
    'Cooking oil with strict price controls':
        'زيت الطهي مع ضوابط صارمة للأسعار',
    'Premium Algerian olive oil with partial price support':
        'زيت زيتون جزائري ممتاز مع دعم جزئي للأسعار',
    'Refined sugar with government price controls':
        'سكر مكرر مع ضوابط حكومية للأسعار',
    'Imported lentils with price controls': 'عدس مستورد مع ضوابط للأسعار',
    'Essential legume for Algerian cuisine': 'بقوليات أساسية للمطبخ الجزائري',
  };

  static String getProductName(String englishName) {
    return productNames[englishName] ?? englishName;
  }

  static String getProductDescription(String englishDescription) {
    return productDescriptions[englishDescription] ?? englishDescription;
  }
}

// French translations for product categories
class CategoryTranslationFr {
  static Map<String, String> categoryNames = {
    'Grains & Cereals': 'Grains & Céréales',
    'Dairy Products': 'Produits Laitiers',
    'Oils & Fats': 'Huiles & Graisses',
    'Sugar & Sweeteners': 'Sucre & Édulcorants',
    'Legumes': 'Légumineuses',
  };

  static String getCategoryName(String englishName) {
    return categoryNames[englishName] ?? englishName;
  }
}

// Arabic translations for product categories
class CategoryTranslationAr {
  static Map<String, String> categoryNames = {
    'Grains & Cereals': 'الحبوب',
    'Dairy Products': 'منتجات الألبان',
    'Oils & Fats': 'الزيوت والدهون',
    'Sugar & Sweeteners': 'السكر والمحليات',
    'Legumes': 'البقوليات',
  };

  static String getCategoryName(String englishName) {
    return categoryNames[englishName] ?? englishName;
  }
}

class ProductList {
  static final List<ProductCategory> productCategories = [
    ProductCategory(
      name: 'Grains & Cereals',
      icon: Icons.grain,
      color: Color(0xFF690B22),
      products: [
        Product(
          name: 'Wheat Flour',
          price: '60 DZD/kg',
          subsidized: true,
          description: 'Government subsidized wheat flour for bread making',
          image: 'lib/core/assets/images/products_images/wheat_flour.jpg',
        ),
        Product(
          name: 'Semolina',
          price: '70 DZD/kg',
          subsidized: true,
          description: 'Essential for couscous and traditional Algerian dishes',
          image: 'lib/core/assets/images/products_images/semolina.webp',
        ),
        Product(
          name: 'Rice',
          price: '120 DZD/kg',
          subsidized: true,
          description: 'Imported rice with government price controls',
          image: 'lib/core/assets/images/products_images/rice.webp',
        ),
      ],
    ),
    ProductCategory(
      name: 'Dairy Products',
      icon: Icons.egg_alt,
      color: Color(0xFF1B4D3E),
      products: [
        Product(
          name: 'Milk',
          price: '25 DZD/L',
          subsidized: true,
          description: 'Pasteurized milk with government price controls',
          image: 'lib/core/assets/images/products_images/milk.jpg',
        ),
        Product(
          name: 'Yogurt',
          price: '30 DZD/unit',
          subsidized: false,
          description: 'Local yogurt production with partial subsidies',
          image: 'lib/core/assets/images/products_images/yogurt.jpg',
        ),
      ],
    ),
    ProductCategory(
      name: 'Oils & Fats',
      icon: Icons.water_drop,
      color: Color(0xFFE07A5F),
      products: [
        Product(
          name: 'Vegetable Oil',
          price: '600 DZD/5L',
          subsidized: true,
          description: 'Cooking oil with strict price controls',
          image: 'lib/core/assets/images/products_images/vegetable_oil.jpg',
        ),
        Product(
          name: 'Olive Oil',
          price: '900 DZD/L',
          subsidized: false,
          description: 'Premium Algerian olive oil with partial price support',
          image: 'lib/core/assets/images/products_images/olive_oil.jpg',
        ),
      ],
    ),
    ProductCategory(
      name: 'Sugar & Sweeteners',
      icon: Icons.cake,
      color: Color(0xFF776B3F),
      products: [
        Product(
          name: 'White Sugar',
          price: '90 DZD/kg',
          subsidized: true,
          description: 'Refined sugar with government price controls',
          image: 'lib/core/assets/images/products_images/white_sugar.webp',
        ),
      ],
    ),
    ProductCategory(
      name: 'Legumes',
      icon: Icons.spa,
      color: Color(0xFF3C7F6B),
      products: [
        Product(
          name: 'Lentils',
          price: '180 DZD/kg',
          subsidized: true,
          description: 'Imported lentils with price controls',
          image: 'lib/core/assets/images/products_images/lentils.jpg',
        ),
        Product(
          name: 'Chickpeas',
          price: '200 DZD/kg',
          subsidized: true,
          description: 'Essential legume for Algerian cuisine',
          image: 'lib/core/assets/images/products_images/chickpeas.jpg',
        ),
      ],
    ),
  ];

  // Helper method to get translated product based on language code
  static Product getTranslatedProduct(Product product, String languageCode) {
    if (languageCode == 'fr') {
      return Product(
        name: ProductTranslationFr.getProductName(product.name),
        price: product.price,
        subsidized: product.subsidized,
        description: ProductTranslationFr.getProductDescription(
          product.description,
        ),
        image: product.image,
      );
    } else if (languageCode == 'ar') {
      return Product(
        name: ProductTranslationAr.getProductName(product.name),
        price: product.price,
        subsidized: product.subsidized,
        description: ProductTranslationAr.getProductDescription(
          product.description,
        ),
        image: product.image,
      );
    }
    return product; // Return original product for English or unsupported languages
  }

  // Helper method to get translated category based on language code
  static String getTranslatedCategoryName(
    String categoryName,
    String languageCode,
  ) {
    if (languageCode == 'fr') {
      return CategoryTranslationFr.getCategoryName(categoryName);
    } else if (languageCode == 'ar') {
      return CategoryTranslationAr.getCategoryName(categoryName);
    }
    return categoryName; // Return original name for English or unsupported languages
  }

  // Get translated product categories based on language code
  static List<ProductCategory> getTranslatedCategories(String languageCode) {
    return productCategories.map((category) {
      return ProductCategory(
        name: getTranslatedCategoryName(category.name, languageCode),
        icon: category.icon,
        color: category.color,
        products:
            category.products
                .map((product) => getTranslatedProduct(product, languageCode))
                .toList(),
      );
    }).toList();
  }
}
