import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';

class CustomCardWithTimer extends StatefulWidget {
  const CustomCardWithTimer({super.key, required this.text, required this.time});
  final String text;
  final String time;

  @override
  State<CustomCardWithTimer> createState() => _CustomCardWithTimerState();
}

class _CustomCardWithTimerState extends State<CustomCardWithTimer> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height *0.2,
          width: size.width,
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              Center(
                child: Text(
                  widget.text,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.l00B533,
                    width: 2,
                  )
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration:  BoxDecoration(
                      color: AppColors.l00B533,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: 3,
                      ),
                  ),
                  child: Center(
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
