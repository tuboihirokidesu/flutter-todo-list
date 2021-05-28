import 'package:flutter/material.dart';

class BottomScreenView extends StatelessWidget {
  final String title;
  final VoidCallback onClickedYes;
  final VoidCallback onClickedNo;

  const BottomScreenView(
      {Key key, this.title, this.onClickedYes, this.onClickedNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onClickedYes,
                  child: Text('Yes'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: onClickedNo,
                  child: Text('No'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
