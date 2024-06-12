import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazytv/src/views/detail.dart';

class Carousel extends StatelessWidget {
  final Map<String, String> items;
  final PageController pageController;
  final int currentPage;

  Carousel({super.key, required this.pageController, required this.currentPage, required this.items});

  @override
  Widget build(BuildContext context) {
    List<String> vidImages = items.values.toList();

    return Container(
      height: 350, 
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: pageController,
        reverse: false,
        itemCount: vidImages.length,
        onPageChanged: (_) {},
        itemBuilder: (_, index) {
          bool pageActive = currentPage == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(
              top: pageActive ? 0 : 30,
              bottom: pageActive ? 0 : 30,
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailView({
                        'image': vidImages[index % vidImages.length],
                        'url': items.keys.toList()[index % vidImages.length],
                      })
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: pageActive ? 3 : 0,
                          spreadRadius: 5,
                          offset: pageActive ? const Offset(0, 5) : const Offset(0, 0)
                        )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          vidImages[index % vidImages.length]
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ), 
                Positioned(
                  bottom: 15,
                  left: -8,
                  child: RawMaterialButton(
                    onPressed: () {
                      print('Add Click');
                    },
                    shape: const CircleBorder(),
                    elevation: 0,
                    fillColor: const Color.fromRGBO(0, 0, 0, 0.6),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.add, 
                      color: Colors.white,
                    ),
                  ),
                ), 
              ],
            ),
          );
        },
      )
    );
  }
}