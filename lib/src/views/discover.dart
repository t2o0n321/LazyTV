import 'package:flutter/material.dart';
import 'package:lazytv/src/widgets/app_bar.dart';
import 'package:lazytv/src/widgets/carousel.dart';
import 'package:lazytv/src/utils/requester/chinaq.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true, 
    viewportFraction: 0.6
  );
  int currentPage = 0;
  late Future<Map<String, String>> _suggestLinksFuture;

  @override
  void initState() {
    super.initState();
    Chinaq chinaq = Chinaq();
    _suggestLinksFuture = chinaq.getSuggestLinks();
    _controller.addListener(() {
      int next = _controller.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Discover',
      ),
      body: Center(child: SafeArea(child: _body())),
    );
  }

  _body() {
    return FutureBuilder(
      future: _suggestLinksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Carousel(
                items: snapshot.data!,
                pageController: _controller,
                currentPage: currentPage,
              )
            ]
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}