import 'dart:ui';

import 'package:building/cubit/app_cubit_state.dart';
import 'package:building/cubit/cubit.dart';
import 'package:building/widgets/app_large_text.dart';
import 'package:building/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Map for small images and text at the bottom
  var bottomImages = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    // Tab Controller for Tab Bar
    TabController tabController = TabController(length: 3, vsync: this);

    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menu and User Profile pic
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu Icon
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    ),

                    // User profile picture
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Discover text
              Padding(
                padding: const EdgeInsets.all(20),
                child: AppLargeText(
                  text: 'Discover',
                ),
              ),

              SizedBox(height: 15),

              // Tab Bar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Tab Bar View
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // Places images
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/' +
                                        info[index].img),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Text('Second'),
                    const Text('Third'),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Explore more
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: 'Explore More',
                      size: 20,
                    ),
                    AppText(
                      text: 'See all',
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // Small images at the bottom
              Container(
                height: 100,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          // Images
                          Container(
                            // margin: EdgeInsets.only(right: 20),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                    'img/' + bottomImages.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),

                          SizedBox(height: 5),

                          // Text below images
                          Container(
                            child: AppText(
                              text: bottomImages.values.elementAt(index),
                              color: Colors.grey,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
      ;
    });
  }
}
