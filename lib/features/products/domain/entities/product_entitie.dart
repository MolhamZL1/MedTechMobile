class ProductEntitie {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final double oldPrice;
  final double rate;
  final int ratingCount;

  ProductEntitie({
    required this.category,
    required this.oldPrice,
    required this.rate,
    required this.ratingCount,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

List<ProductEntitie> products = [
  ProductEntitie(
    id: "1",
    name: "Product1",
    description: "description1",
    price: 10.0,
    image:
        "https://th.bing.com/th/id/R.780bb0b70e3c2cd69ef00b23992e2762?rik=UJidpe0gztC1dQ&pid=ImgRaw&r=0",
    category: "category1",
    oldPrice: 15.0,
    rate: 4.0,
    ratingCount: 200,
  ),
  ProductEntitie(
    id: "2",
    name: "Product2",
    description: "description2",
    price: 20.0,
    image:
        "https://www.bikhamhealthcare.com/provider-resources/wp-content/uploads/2022/12/Diabetes4152.jpg",
    category: "category2",
    oldPrice: 30.0,
    rate: 4.5,
    ratingCount: 300,
  ),
  ProductEntitie(
    id: "3",
    name: "Product3",
    description: "description3",
    price: 30.0,
    image:
        "https://th.bing.com/th/id/R.780bb0b70e3c2cd69ef00b23992e2762?rik=UJidpe0gztC1dQ&pid=ImgRaw&r=0",
    category: "category3",
    oldPrice: 40.0,
    rate: 4.8,
    ratingCount: 400,
  ),
];
