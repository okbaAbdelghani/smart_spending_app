import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_spending/modules/home/home.dart';
import 'package:smart_spending/modules/transactions/transactions.dart';
import 'package:smart_spending/modules/budgets/budgets.dart';
import 'package:smart_spending/modules/profile/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(microseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [HomeScreen(), Transactions(), Budgets(), Profile()],
        ),
        bottomNavigationBar: Stack(
          children: [
            if (_currentIndex == 0) HomeScreen(),
            if (_currentIndex == 1) const Transactions(),
            if (_currentIndex == 2) const Budgets(),
            if (_currentIndex == 3) const Profile(),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: const Color.fromRGBO(252, 252, 252, 1),
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    const Center(
                      heightFactor: 0.2,
                      child: CollapseButtonDemo(),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _onTabTapped(0);
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/home.svg',
                                    color: _currentIndex == 0
                                        ? const Color.fromRGBO(127, 61, 255, 1)
                                        : const Color.fromRGBO(
                                            198, 198, 198, 1),
                                  )),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: _currentIndex == 0
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _onTabTapped(1);
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/Transaction.svg',
                                  color: _currentIndex == 1
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              ),
                              Text(
                                'Transaction',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: _currentIndex == 1
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              )
                            ],
                          ),
                          Container(width: size.width * 0.20),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _onTabTapped(2);
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/pie-chart.svg',
                                    color: _currentIndex == 2
                                        ? const Color.fromRGBO(127, 61, 255, 1)
                                        : const Color.fromRGBO(
                                            198, 198, 198, 1),
                                  )),
                              Text(
                                'Budget',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: _currentIndex == 2
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _onTabTapped(3);
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/user.svg',
                                  color: _currentIndex == 3
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: _currentIndex == 3
                                      ? const Color.fromRGBO(127, 61, 255, 1)
                                      : const Color.fromRGBO(198, 198, 198, 1),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CollapseButtonDemo extends StatefulWidget {
  const CollapseButtonDemo({super.key});

  @override
  _CollapseButtonDemoState createState() => _CollapseButtonDemoState();
}

bool toggle = true;

class _CollapseButtonDemoState extends State<CollapseButtonDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        reverseDuration: const Duration(milliseconds: 275));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Alignment alignment1 = const Alignment(0.0, 0.0);
  Alignment alignment2 = const Alignment(0.0, 0.0);
  Alignment alignment3 = const Alignment(0.0, 0.0);
  double size1 = 56.0;
  double size2 = 56.0;
  double size3 = 56.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          alignment: alignment1,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 275),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: size1,
            width: size1,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 168, 107, 1),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SvgPicture.asset(
              'assets/icons/income-white.svg',
              width: 24.0,
              height: 28.0,
              alignment: Alignment.center,
            ),
          ),
        ),
        AnimatedAlign(
          alignment: alignment2,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 275),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: size2,
            width: size2,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 119, 255, 1),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SvgPicture.asset(
              'assets/icons/currency-exchange.svg',
              width: 24.0,
              height: 24.0,
              alignment: Alignment.center,
            ),
          ),
        ),
        AnimatedAlign(
          alignment: alignment3,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 275),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: size3,
            width: size3,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(253, 60, 74, 1),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SvgPicture.asset(
              'assets/icons/expense-white.svg',
              width: 24.0,
              height: 28.0,
              alignment: Alignment.center,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: _animation.value * pi * (3 / 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              height: toggle ? 57.0 : 60,
              width: toggle ? 57.0 : 60,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(127, 61, 255, 1),
                  borderRadius: BorderRadius.circular(50.0)),
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                    splashColor: Colors.white54,
                    splashRadius: 31.0,
                    icon: SvgPicture.asset('assets/icons/close.svg'),
                    onPressed: () => {
                          setState(() {
                            if (toggle) {
                              toggle = !toggle;
                              _animationController.forward();
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment1 = const Alignment(-0.4, -3.8);
                              });
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment2 = const Alignment(0.0, -7.8);
                              });
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment3 = const Alignment(0.4, -3.8);
                              });
                            } else {
                              toggle = !toggle;
                              _animationController.reverse();
                              alignment1 = const Alignment(0.0, 0.0);
                              alignment2 = const Alignment(0.0, 0.0);
                              alignment3 = const Alignment(0.0, 0.0);
                            }
                          })
                        }),
              ),
            ),
          ),
        )
      ],
    );
  }
}
