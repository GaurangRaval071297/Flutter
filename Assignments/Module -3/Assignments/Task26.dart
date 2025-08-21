import 'package:flutter/material.dart';

class Task26 extends StatefulWidget {
  const Task26({super.key});

  @override
  State<Task26> createState() => _Task26State();
}

class _Task26State extends State<Task26> {
  List productName = [
    'Kesar Srikhand',
    'Cheese Block',
    'Mango Milkshake',
    'Super Gold',
    'Maahi Cow Ghee',
  ];

  List productImg = [
    'https://www.maahimilk.com/Portals/0/Images/3.png',
    'https://www.jiomart.com/images/product/original/490006790/mother-dairy-processed-cheese-block-200-g-product-images-o490006790-p591239038-0-202308301736.jpg?im=Resize=(1000,1000)',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCU-ZEpXlYJ2WbWxfkQE5Hy13C9ZJ8-WXxpA&s',
    'https://5.imimg.com/data5/SELLER/Default/2023/5/306944083/WQ/PW/QF/106193684/maahi-super-gold-pasteurised-full-cream-milk.png',
    'https://www.maahimilk.com/portals/0/Images/CowGheeBig.jpg',
  ];

  List productPrice = [
    'Rs. 35.0',
    'Rs. 140.0',
    'Rs. 30.0',
    'Rs. 38.0',
    'Rs. 320.0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task 26',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productName.length,
        itemBuilder: (context, index) {
          while (true) {
            return showDetails(
              Text(productName[index]),
              Image(image: NetworkImage(productImg[index])),
              Text(productPrice[index]),
            );
          }
        },
      ),
    );
  }

  showDetails(title, leading, subtitle) {
    return ListTile(title: title, leading: leading, subtitle: subtitle);
  }
}
