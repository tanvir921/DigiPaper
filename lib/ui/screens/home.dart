import 'package:carousel_slider/carousel_slider.dart';
import 'package:digipaper/ui/custom_widgets/news_layout.dart';
import 'package:digipaper/ui/custom_widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          const CustomSlider(),
          NewsLayout(),
        ],
      ),
    ),
    const Center(child: Icon(Icons.ac_unit_sharp)),
    const Center(child: Icon(Icons.access_alarm_rounded)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   bottom: PreferredSize(
      //     child: Container(),
      //     preferredSize: Size.fromHeight(10),
      //   ),
      //   title: null,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 20),
      //     child: IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.menu,
      //           size: 30,
      //         )),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20),
      //       child: IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.search,
      //           size: 30,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: _pages,
        ),
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              blurStyle: BlurStyle.normal,
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          //elevation: 50,
          //type: BottomNavigationBarType.fixed,
          iconSize: 24.0,
          selectedItemColor: Colors.green,
          showUnselectedLabels: false,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          showSelectedLabels: false,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
