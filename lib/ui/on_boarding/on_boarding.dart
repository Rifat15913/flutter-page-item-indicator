import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

const int numberOfPages = 4;

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  List titles = [
    "Page 1",
    "Page 2",
    "Page 3",
    "Page 4",
  ];

  List subTitles = [
    "This is page 1 subtitle",
    "This is page 2 subtitle",
    "This is page 3 subtitle",
    "This is page 4 subtitle",
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(
          "Item Indicator Demo",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: PageView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: numberOfPages,
              controller: _pageController,
              onPageChanged: (int index) {
                if (this.mounted) {
                  setState(() {});
                }
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 32.0,
                        ),
                        child: Text(
                          subTitles[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 48.0),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      child: SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: numberOfPages,
                        effect: WormEffect(
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          paintStyle: PaintingStyle.fill,
                          dotColor: Colors.white,
                          activeDotColor: Colors.amber,
                        ), // your preferred effect
                        onDotClicked: (index) {},
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
