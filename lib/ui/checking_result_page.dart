import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class CheckingResultPage extends StatefulWidget {
  final String imagePath;
  final int count;
  const CheckingResultPage({
    super.key,
    required this.imagePath,
    required this.count,
  });

  @override
  State<CheckingResultPage> createState() => _CheckingResultPageState();
}

class _CheckingResultPageState extends State<CheckingResultPage> {
  bool _visible = true;
  late int firstRatio;
  late int secondaryRatio;
  late int thirdRatio;

  List<String> flowerName = [
    'Dandelion',
    'Sunflower',
    'Roses',
    'Iris',
    'Tulip',
  ];

  late Random rng = Random();
  @override
  void initState() {
    print(widget.imagePath);
    super.initState(); //when this route starts, it will execute this code
    Future.delayed(const Duration(milliseconds: 3500), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          _visible =
              false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });

    firstRatio = random(97, 99);
    secondaryRatio = 100 - firstRatio;
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    final isDandelion = widget.count <= 2;

    return Scaffold(
      // appBar: AppBar(title: Text('Result')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Visibility(
                  //Your widget is gone and won't take up space
                  visible: _visible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Center(
                      child: CircularPercentIndicator(
                        radius: 80.0,
                        animation: true,
                        animationDuration: 3000,
                        lineWidth: 15.0,
                        percent: 1,
                        center: Text(
                          "Checking",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.green,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  //Your widget is gone and won't take up space
                  visible: !_visible,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40.0)),
                      image: DecorationImage(
                          image: AssetImage(widget.imagePath),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    top: 56.0,
                    left: 24.0,
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[800]!.withOpacity(0.5),
                            shape: BoxShape.circle),
                        child: BackButton(color: Colors.white)))
              ],
            ),
            const SizedBox(height: 32.0),
            Visibility(
              //Your widget is gone and won't take up space
              visible: !_visible,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                                isDandelion ? flowerName[0] : flowerName[1],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ))),
                        Text('Accuracy: $firstRatio%',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[0] : flowerName[1]).toLowerCase()}/${(isDandelion ? 'd_' : 's_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                            height: 88.0,
                            width: 88.0,
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.green,
                                ),
                                Text('More',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                                isDandelion ? flowerName[2] : flowerName[4],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ))),
                        Text('Accuracy: $secondaryRatio%',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                          height: 88.0,
                          width: 88.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${(isDandelion ? flowerName[2] : flowerName[4]).toLowerCase()}/${(isDandelion ? 'r_' : 't_')}00${random(1, 10)}.jpg'))),
                        ),
                        Container(
                            height: 88.0,
                            width: 88.0,
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.green,
                                ),
                                Text('More',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
