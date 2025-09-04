import 'package:flutter/cupertino.dart';
class CreateAiContentContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color textColor;

  const CreateAiContentContainer({Key? key, required this.color1, required this.color2, required this.color3, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
            color3,
          ],
          stops: [0.0, 0.40, 0.9],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Text(
          "CREATE READİNG\n   TEXT WITH AI",
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}