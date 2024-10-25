import 'package:assignment_test_xsis/module/home/controller/home_controller.dart';
import 'package:assignment_test_xsis/module/home/widget/home_headline.dart';
import 'package:assignment_test_xsis/module/home/widget/home_latest.dart';
import 'package:assignment_test_xsis/module/home/widget/home_movie_by_genres.dart';
import 'package:assignment_test_xsis/module/search/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Netplix'),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(const SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          drawer: const Drawer(),
          body: homeBody(controller),
        );
      },
    );
  }

  Widget homeBody(HomeController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeadline(
            controller: controller,
          ),
          const SizedBox(
            height: 8,
          ),
          HomeLatest(
            controller: controller,
          ),
          const SizedBox(
            height: 8,
          ),
          MovieByGenre(
            controller: controller,
          ),
        ],
      ),
    );
  }
}


