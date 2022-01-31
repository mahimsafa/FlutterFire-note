import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LgPage2 extends StatelessWidget {
  const LgPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: -30,
          child: SvgPicture.asset('assets/cloud.svg'),
        ),
        Positioned(
          bottom: 140,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Be Safe With Cloud',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Lora',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'All your data is stored in cloud. So nothing to worry about data loss.',
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
