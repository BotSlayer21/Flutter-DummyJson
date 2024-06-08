import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final dataProduct = ModalRoute.of(context)!.settings.arguments as Map;

    List<String> imageUrls = [
      // 'https://cdn.dummyjson.com/product-images/${dataProduct['id']}/1.jpg',
      // 'https://cdn.dummyjson.com/product-images/${dataProduct['id']}/2.jpg',
      // 'https://cdn.dummyjson.com/product-images/${dataProduct['id']}/3.jpg',
      // 'https://cdn.dummyjson.com/product-images/${dataProduct['id']}/4.jpg',
      dataProduct['thumbnail']
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toro Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        elevation: 20,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: imageUrls.map((url) {
              return Container(
                child: Image.network(url),
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              autoPlay: true,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name : ${dataProduct['title']}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Description : ${dataProduct['description']}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Category : ${dataProduct['category']}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.attach_money, color: Colors.green),
                    Text(
                      'Price : \$ ${dataProduct['price'].toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.red),
                    Text(
                      'Discount : ${dataProduct['discountPercentage'].toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.storage_outlined, color: Colors.blue),
                    Text(
                      'Stock : ${dataProduct['stock'].toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      'Rating : ${dataProduct['rating'].toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
