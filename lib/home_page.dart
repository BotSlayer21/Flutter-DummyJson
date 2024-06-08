import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List listData = [];
  void getData() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    var responseJson = jsonDecode(response.body);
    setState(() {
      listData = responseJson['products'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.storefront, color: Colors.black, size: 40),
        title: Text(
          'Toro Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize: 25,
          ),
        ),
        elevation: 20,
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          String thumbnailUrl = listData[index]['thumbnail'];
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/product-detail', arguments: listData[index]);
              },
              contentPadding: EdgeInsets.all(0),
              title: Center(
                child: SizedBox(
                  height: 40,
                  child: Text(
                    '${listData[index]['title']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                      height: 200,
                      child: Center(
                        child: Image.network(thumbnailUrl),
                      ),
                    ),
                  Text(
                    'Brand : ${listData[index]['brand']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Category : ${listData[index]['category']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      Text(
                        'Price : \$ ${listData[index]['price'].toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.local_offer, color: Colors.red),
                      Text(
                        'Discount : ${listData[index]['discountPercentage'].toStringAsFixed(1)} %',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.storage_outlined, color: Colors.blue),
                      Text(
                        'Stock : ${listData[index]['stock'].toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        'Rating : ${listData[index]['rating'].toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}