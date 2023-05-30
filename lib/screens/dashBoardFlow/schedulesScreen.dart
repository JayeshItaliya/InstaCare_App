import 'package:flutter/material.dart';
import 'package:flutter_cool_card_swiper/constants.dart';
import 'package:flutter_cool_card_swiper/data.dart';
import 'package:flutter_cool_card_swiper/widgets/cool_swiper.dart';

class SchedulesScreen extends StatefulWidget {
  const SchedulesScreen({Key? key}) : super(key: key);

  @override
  State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CoolSwiper(
            children: List.generate(
              Data.colors.length,
                  (index) => Container(
                height: Constants.cardHeight,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Data.colors[index],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text("hii"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
