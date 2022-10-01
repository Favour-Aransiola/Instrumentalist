import 'package:complex_ui_one/common_widgets/intrument_card.dart';
import 'package:flutter/material.dart';

class SelectInstrument extends StatefulWidget {
  const SelectInstrument({super.key});

  @override
  State<SelectInstrument> createState() => _SelectInstrumentState();
}

class _SelectInstrumentState extends State<SelectInstrument> {
  final pageController = PageController(
    viewportFraction: 0.7,
  );
  List<Map<String, String>> instrumentList = [
    {'image': 'assets/images/guitar1.png', 'title': 'Violin', 'index': '0'},
    {'image': 'assets/images/guitar2.png', 'title': 'Guitar', 'index': '1'},
    {'image': 'assets/images/guitar3.png', 'title': 'Guitar', 'index': '2'},
    {'image': 'assets/images/guitar4.png', 'title': 'Guitar', 'index': '3'}
  ];
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            'What instrument do you play?',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'You can change it anytime',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: instrumentList.length,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return InstrumentCard(
                  imageUrl: instrumentList[index]['image']!,
                  title: instrumentList[index]['title']!,
                  index: index,
                  currIndex: currIndex,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: currIndex == 0 ? 10 : 30,
                  height: 5,
                  color: currIndex == 0 ? Colors.black : Colors.grey,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: currIndex == 1 ? 10 : 30,
                  height: 5,
                  color: currIndex == 1 ? Colors.black : Colors.grey,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: currIndex == 2 ? 10 : 30,
                  height: 5,
                  color: currIndex == 2 ? Colors.black : Colors.grey,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: currIndex == 3 ? 10 : 30,
                  height: 5,
                  color: currIndex == 3 ? Colors.black : Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 290),
            height: 90,
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
