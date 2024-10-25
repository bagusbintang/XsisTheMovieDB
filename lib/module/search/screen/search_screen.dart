import 'dart:developer';

import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/search/controller/searching_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      init: SearchingController(),
      builder: (SearchingController controller) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              controller: controller.searchController,
              onEditingComplete: () {
                log('masuk sini kann ??');
                controller.searchMovie();
              },
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  controller.searchMovie();
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          drawer: const Drawer(),
          body: Obx(() {
            if (controller.searchLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Popular'),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 0,
                      runSpacing: 10,
                      children: controller.listMovie
                          .map(
                            (movie) => GestureDetector(
                              onTap: () => controller.showDetail(movieId: movie.id??0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 16, right: 16, bottom: 16),
                                margin: const EdgeInsets.only(
                                  right: 16,
                                ),
                                width: 140,
                                decoration: const BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      movie.title.toString(),
                                      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    movie.posterPath != null
                                        ? Image.network(
                                            TMBDStrings.getThumbImg +
                                                movie.posterPath.toString(),
                                            // 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn2.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQeZl5f7yIvMVDPbWnJdds7oedgLAxvmVDCaYrmDlcMaNx9DvVb&psig=AOvVaw0vKhH9AbEPyb4YvggTFAZe&ust=1729844686839000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCICpy-LLpokDFQAAAAAdAAAAABAE',
                                            width: 100,
                                            height: 100,
                                          )
                                        : const SizedBox(
                                            height: 100,
                                            width: 100,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
