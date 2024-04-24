class Car {
  final String id;
  final String ownerId;
  final String brand;
  final String model;
  final String maxSpeed;
  final String imageUrl;
  final String transmission;

  Car({
    required this.id,
    required this.ownerId,
    required this.brand,
    required this.model,
    required this.maxSpeed,
    required this.imageUrl,
    required this.transmission,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['licensePlate'] ?? '',
      ownerId: json['id'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      transmission: json['transmission'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      maxSpeed: json['maxSpeed'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'brand': brand,
      'model': model,
      'transmission': transmission,
      'imageUrl': imageUrl,
      'maxSpeed': maxSpeed,
    };
  }
}
