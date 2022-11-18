import 'package:building/cubit/app_cubit_state.dart';
import 'package:building/cubit/cubit.dart';
import 'package:building/widgets/app_buttons.dart';
import 'package:building/widgets/app_large_text.dart';
import 'package:building/widgets/app_text.dart';
import 'package:building/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  // bool to check which button is selected in number of people
  int isSelectedButton = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                // Image
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/' +
                                detail.place.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Menu and dot icons
                Positioned(
                  left: 20,
                  top: 70,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Menu icon
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.arrow_back_sharp),
                        color: Colors.white,
                      ),

                      // Dots icon
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                // All the stuff below the image
                Positioned(
                  top: 330,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Place name and trip charges
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black54,
                            ),
                            AppLargeText(
                              text: '\$ ' + detail.place.price.toString(),
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        // Country and state name
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 5),
                            AppText(
                              text: 'USA, California',
                              color: Colors.black45,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Star Ratings and no. of reviews
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: Colors.yellow[800]);
                              }),
                            ),
                            SizedBox(height: 10),
                            AppText(
                              text: '(4)',
                              color: Colors.black45,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Number of People on trip
                        AppLargeText(text: 'People', size: 20),
                        SizedBox(height: 10),
                        AppText(text: 'Number of people in your group'),
                        SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isSelectedButton = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: isSelectedButton == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: isSelectedButton == index
                                      ? Colors.black
                                      : Colors.grey,
                                  borderColor: isSelectedButton == index
                                      ? Colors.black
                                      : Colors.grey,
                                  size: 50,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),

                        SizedBox(height: 10),

                        // Description text
                        AppLargeText(
                          text: 'Discription',
                          color: Colors.black87,
                          size: 20,
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text:
                              'You must go to travel. Travelling helps u to get rid of pressure. Go to the mountains to see the nature.',
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),

                // Heart icon and book ticket now button
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Heart icon
                      AppButtons(
                        isIcon: true,
                        icon: Icons.favorite_border,
                        color: Colors.grey,
                        backgroundColor: Colors.white,
                        borderColor: Colors.grey,
                        size: 60,
                      ),

                      // Book Ticket now button
                      Container(
                        height: 60,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepPurple,
                        ),
                        child: Center(
                          child: Text(
                            'Book Trip Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
