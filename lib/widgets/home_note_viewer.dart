import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteContainer extends StatelessWidget {
  dynamic data;
  NoteContainer({Key? key, this.data}) : super(key: key);

  convert() {
    var createdAt = data['createdAt'].toDate();
    var finalTime = DateFormat().add_yMMMd().add_jm().format(createdAt);

    return finalTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'],
              style: const TextStyle(
                color: Color(0xff3d3d3d),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              convert(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data['content'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff4f5f5f),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
