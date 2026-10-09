import 'package:flutter/material.dart';

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق عقارات',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // تأكد من توفر الخط أو استبداله بالافتراضي
      ),
      home: const HomeScreen(),
    );
  }
}

class Property {
  final String title;
  final String location;
  final String price;
  final String imageUrl;
  final int bedrooms;
  final int bathrooms;
  final double area;

  Property({
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // قائمة وهمية لتجربة العرض
  final List<Property> properties = const [
    Property(
      title: 'فيلا فخمة مع إطلالة على البحر',
      location: 'جدة، حي الشاطئ',
      price: '\$1,200,000',
      imageUrl: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9',
      bedrooms: 5,
      bathrooms: 6,
      area: 450.0,
    ),
    Property(
      title: 'شقة حديثة في وسط المدينة',
      location: 'الرياض، حي العليا',
      price: '\$350,000',
      imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00',
      bedrooms: 3,
      bathrooms: 2,
      area: 180.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'عقارات مميزة',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن مدينة، حي، أو عقار...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'العقارات المتاحة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // قائمة العقارات
            Expanded(
              child: ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة العقار
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            property.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                property.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    property.location,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    property.price,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.bed,
                                          size: 16, color: Colors.grey),
                                      Text(' ${property.bedrooms} '),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.bathtub,
                                          size: 16, color: Colors.grey),
                                      Text(' ${property.bathrooms} '),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.square_foot,
                                          size: 16, color: Colors.grey),
                                      Text(' ${property.area}م²'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}