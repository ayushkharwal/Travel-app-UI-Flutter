import 'package:building/cubit/cubit.dart';
import 'package:building/widgets/app_large_text.dart';
import 'package:building/widgets/app_text.dart';
import 'package:building/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            // setting height and width of the container to max
            width: double.maxFinite,
            height: double.maxFinite,

            // decoration
            decoration: BoxDecoration(
              // Adding image
              image: DecorationImage(
                image: AssetImage('img/' + images[index]),
                fit: BoxFit.cover,
              ),
            ),

            // Text on pages
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // All the text
                        AppLargeText(text: 'Trips'),
                        AppText(text: 'Mountains', size: 40),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                'Mountain hike give a sense of freedom along with endurance test.',
                          ),
                        ),
                        SizedBox(height: 40),

                        // MyButton
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.indigo[400],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'img/button-one.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // 3 Dots on the right hand size
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: List.generate(3, (indexDot) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 8,
                            height: index == indexDot ? 40 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDot
                                  ? Colors.indigo[400]
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
