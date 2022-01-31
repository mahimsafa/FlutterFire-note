import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LgPage4 extends StatelessWidget {
  const LgPage4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 35,
          child: SvgPicture.asset('assets/lock.svg'),
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
                  'Secure File',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Lora',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Data will be secure with high quality encryption.',
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
