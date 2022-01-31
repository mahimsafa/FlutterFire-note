import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LgPage3 extends StatelessWidget {
  const LgPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset('assets/notebook3.svg'),
        Positioned(
          bottom: 140,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Universal Access',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Lora',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Access from anywhere any time.',
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
