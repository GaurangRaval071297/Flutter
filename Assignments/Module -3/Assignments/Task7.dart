import 'package:flutter/material.dart';

class Task7 extends StatefulWidget {
  const Task7({super.key});

  @override
  State<Task7> createState() => _Task7State();
}

class _Task7State extends State<Task7> {
  List carImg = [
    'https://www.carandbike.com/_next/image?url=https%3A%2F%2Fimages.carandbike.com%2Fcar-images%2Fcolors%2Ftata%2Fnexon%2Ftata-nexon-daytona-grey.jpg%3Fv%3D1695383735&w=750&q=75',
    'https://stimg.cardekho.com/images/carexteriorimages/930x620/Tata/Nexon/9675/1751559838445/front-left-side-47.jpg',
    'https://imgd.aeplcdn.com/664x374/n/cw/ec/141867/nexon-exterior-right-rear-three-quarter-2.jpeg?isig=0&q=80',
    'https://imgd.aeplcdn.com/664x374/n/cw/ec/149123/nexon-ev-exterior-right-front-three-quarter-79.jpeg?isig=0&q=40'
        'https://imgd.aeplcdn.com/642x361/n/cw/ec/136217/x7-exterior-right-front-three-quarter-8.jpeg?isig=0&q=75',
    'https://images.drivespark.com/img/2016/02/bmw-i8-launch-12-1455284013.jpg',
    'https://content.carlelo.com/uploads/model/bmw-7-series-1.webp',
    'https://images.pexels.com/photos/100653/pexels-photo-100653.jpeg?cs=srgb&dl=pexels-mikebirdy-100653.jpg&fm=jpg',
    'https://www.carbike360.com/_next/image?url=https%3A%2F%2Fs3.ap-south-1.amazonaws.com%2Fcb360static%2Fuploads%2F8b621949-43ae-411a-815b-06ba7ec6e482-small-BMW%25203%2520Series%2520LWB.avif&w=3840&q=75',
    'https://assets-eu-01.kc-usercontent.com/fb793c58-315a-0196-d3af-7c9c2613d52c/1fb1f2b6-6ead-46df-9536-a5130b0ccc99/P90484997_highRes_bmw-330e-xdrive-tour%20copy.jpg?w=1440&q=100&auto=format',
    'https://5.imimg.com/data5/BI/XG/MY-13294402/rolls-royce-phantom-car.png',
    'https://static.toiimg.com/thumb/msid-91545248,width-1280,height-720,resizemode-4/91545248.jpg',
    'https://hips.hearstapps.com/hmg-prod/images/phantom-scintilla-private-collection-0-1-66b50a5eddd44.jpg?crop=0.832xw:0.832xh;0.0849xw,0.168xh&resize=1200:*',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/2023_Lamborghini_Aventador_Ultimae.jpg/1200px-2023_Lamborghini_Aventador_Ultimae.jpg',
    'https://images.forbesindia.com/media/images/2022/Aug/img_192647_lamborghini.jpg',
  ];

  var carCount = [
    'Car No: 1',
    'Car No: 2',
    'Car No: 3',
    'Car No: 4',
    'Car No: 5',
    'Car No: 6',
    'Car No: 7',
    'Car No: 8',
    'Car No: 9',
    'Car No: 10',
    'Car No: 11',
    'Car No: 12',
    'Car No: 13',
    'Car No: 14',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task 7',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        itemCount: carImg.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(carImg[index]),
                SizedBox(height: 5),
                Text(carCount[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
