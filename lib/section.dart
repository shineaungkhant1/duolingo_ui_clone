import 'package:flutter/material.dart';

class SectionData {
  final Color color;
   final String title;

  const SectionData({
    this.color = const Color.fromRGBO(253, 225, 193, 1),
    required this.title,
  });
}

class Section extends StatelessWidget {
  final SectionData data;
  const Section({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Color(0xFF2D3D41),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              data.title,
              style: const TextStyle(
                color: Color(0xFF52656D),
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: Divider(
                color: Color(0xFF2D3D41),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        ...List.generate(
          9,
          (i) => i % 9 != 4
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: i != 8 ? 24.0 : 0,
                    left: getLeft(i),
                    right: getRight(i),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // fixedSize: const Size(56, 48),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size.zero,
                    ),
                    child: Image.asset(
                      'assets/quiz-difficult-active.png',
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(
                    'assets/quiz-difficult-inactive.png',
                    width: 72,
                    height: 72,
                  ),
                ),
        )
      ],
    );
  }

  double getLeft(int indice) {
    const margin = 72.0;
    int pos = indice % 9;

    if (pos == 1) {
      return margin;
    }
    if (pos == 2) {
      return margin * 2;
    }
    if (pos == 3) {
      return margin;
    }

    return 0.0;
  }

  double getRight(int indice) {
    const margin = 72.0;
    int pos = indice % 9;

    if (pos == 5) {
      return margin;
    }
    if (pos == 6) {
      return margin * 2;
    }
    if (pos == 7) {
      return margin;
    }

    return 0.0;
  }
}
