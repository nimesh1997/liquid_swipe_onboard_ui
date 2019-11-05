import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'model/BoardingPageModel.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  bool displayArrowIcon = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        slideIconWidget: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
          child: Center(
              child: Icon(
            Icons.arrow_back_ios,
            size: 12.0,
          )),
        ),
        positionSlideIcon: 0.6,
        enableSlideIcon: displayArrowIcon,
        fullTransitionValue: 500.0,
        waveType: WaveType.liquidReveal,
        onPageChangeCallback: (page) => onPageChangeCallback(page),
        currentUpdateTypeCallback: (page) => currentUpdateTypeCallback(page),
        pages: onBoardPages(),
      ),
    );
  }

  /// region: Overridden methods
  /// pageChanging Callback
  onPageChangeCallback(int page) {
    print('onPageChangeCallback: ' + page.toString());
  }

  /// currentUpdateType Callback
  currentUpdateTypeCallback(UpdateType updateType) {
    print('currentUpdateTypeCallback: ' + updateType.toString());

    if (updateType == UpdateType.dragging) {
      setState(() {
        displayArrowIcon = true;
      });
    }

    if (updateType == UpdateType.doneAnimating || updateType == UpdateType.doneDragging || updateType == UpdateType.animating) {
      setState(() {
        displayArrowIcon = false;
      });
    }
  }

  /// endregion

  ///region: widgets
  /// this method return the list of the container
  List<Container> onBoardPages() {
    List<Container> pageList = List();
    for (int i = 0; i < pages.length; i++) {
      pageList.add(_buildPage1(pages[i].color, pages[i].headline, pages[i].descLine, pages[i].image, pages[i].textColor));
    }
    return pageList;
  }

  Container _buildPage1(Color color, String headline, String descLine, String imageUrl, Color textColor) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: double.infinity,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAppBar(textColor),
          _buildImage(imageUrl),
          _buildText(headline, descLine, textColor),
        ],
      ),
    );
  }

  _buildAppBar(Color textColor) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0),
      child: Text(
        'Flutter OnBoarding UI',
        textScaleFactor: 1.0,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
      ),
    );
  }

  _buildText(String headLine, String descLine, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 40.0, right: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            headLine,
            textScaleFactor: 1,
            style: TextStyle(
              fontSize: 24.0,
              color: textColor,
              fontFamily: 'CircularStd',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              descLine,
              style: TextStyle(fontSize: 16.0, color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  _buildImage(String imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 1.75,
      margin: EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0),
      child: Image.asset(imageUrl),
    );
  }

  /// endregion
}
