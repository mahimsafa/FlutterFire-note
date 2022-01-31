import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LgPage1 extends StatelessWidget {
  const LgPage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -25,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset('assets/notebook4.svg'),
        ),
        Positioned(
          bottom: 140,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Make Notes',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Lora',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Make notes whenever you need to remember something.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'SupermercadoOne'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
