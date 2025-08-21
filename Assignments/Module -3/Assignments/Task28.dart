import 'package:flutter/material.dart';

class Task28 extends StatefulWidget {
  const Task28({super.key});

  @override
  State<Task28> createState() => _Task28State();
}

class _Task28State extends State<Task28> {
  List<String> productsName = [
    'Kesar Srikhand',
    'Cheese Block',
    'Mango Milkshake',
    'Super Gold',
    'Butter Milk',
    'Maahi Cow Ghee',
  ];

  List<String> productsImg = [
    'https://www.maahimilk.com/Portals/0/Images/3.png',
    'https://www.jiomart.com/images/product/original/490006790/mother-dairy-processed-cheese-block-200-g-product-images-o490006790-p591239038-0-202308301736.jpg?im=Resize=(1000,1000)',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCU-ZEpXlYJ2WbWxfkQE5Hy13C9ZJ8-WXxpA&s',
    'https://5.imimg.com/data5/SELLER/Default/2023/5/306944083/WQ/PW/QF/106193684/maahi-super-gold-pasteurised-full-cream-milk.png',
    'https://5.imimg.com/data5/SK/AM/SH/SELLER-106193684/whatsapp-image-2020-06-10-at-11-52-42-am-1-.jpeg',
    'https://www.maahimilk.com/portals/0/Images/CowGheeBig.jpg',
  ];

  List<String> productsPrice = [
    'Rs. 35.0',
    'Rs. 140.0',
    'Rs. 30.0',
    'Rs. 38.0',
    'Rs. 13.0',
    'Rs. 320.0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 28',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(15, 15, 15, 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsName.length,
          itemBuilder: (context, index) {
            return showProducts(
              productsImg[index],
              productsName[index],
              productsPrice[index],
            );
          },
        ),
      ),
    );
  }

  showProducts(String img, String name, String price) {
    return SizedBox(
      width: 200,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        title: Image.network(img, height: 100, width: 100, fit: BoxFit.cover),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 2),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(price, style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
