import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithDotsPage extends StatefulWidget {
  List<String> imgList;

  CarouselWithDotsPage({this.imgList});

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 500,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Text(
                        // 'Date: ${widget.imgList.indexOf(item)} Time:',
                        'Date: DD/MM/YY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                      child: Text(
                        // 'Date: ${widget.imgList.indexOf(item)} Time:',
                        'Time: HH.MM',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 80, 0, 0),
                      child: Text(
                        // 'Date: ${widget.imgList.indexOf(item)} Time:',
                        'Education Score:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(100, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            "Results: Education",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        // Text(
        //   "Please Choose Date and Time",
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 18,
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: widget.imgList.map((url) {
        //     int index = widget.imgList.indexOf(url);
        //     return Container(
        //       width: 12,
        //       height: 12,
        //       margin: EdgeInsets.symmetric(
        //         vertical: 10,
        //         horizontal: 3,
        //       ),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: _current == index
        //             ? Color.fromRGBO(0, 0, 0, 0.9)
        //             : Color.fromRGBO(0, 0, 0, 0.4),
        //       ),
        //     );
        //  }).toList(),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            "* As the results only inform falls risk and does nt make a diagnoses or suggest changes of current medical dosages. Please refer to your physiotherapist for further information.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
