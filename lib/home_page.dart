import 'package:duolingo_ui_clone/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = <SectionData>[
    SectionData(
      color: Color.fromRGBO(253, 225, 193, 1),
      title: 'Politics',
    ),
    SectionData(
      color: Color.fromRGBO(253, 225, 193, 1),
      title: "Important Ideas in Politics",
    ),
    SectionData(
      color: Color.fromRGBO(253, 225, 193, 1),
      title: "Legitimacy",
    ),
    SectionData(
      color: Color.fromRGBO(253, 225, 193, 1),
      title: "System of Government",
    ),
  ];
  int iCurrentSection = 0;
  final heightFirstBox = 56.0;
  final heightSection = 764.0;
  final scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollCtrl.addListener(scrollListener);
  }

  void scrollListener() {
    final currentScroll = scrollCtrl.position.pixels - heightFirstBox - 24.0;
    int index = (currentScroll / heightSection).floor();

    if (index < 0) index = 0;

    if (index != iCurrentSection) setState(() => iCurrentSection = index);
  }

  @override
  void dispose() {
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Stack(
        children: [
          ListView.separated(
            controller: scrollCtrl,
            itemBuilder: (_, i) => i == 0
                ? SizedBox(
              height: heightFirstBox,
            )
                : Section(
              data: data[i - 1],
            ),
            separatorBuilder: (_, i) => const SizedBox(
              height: 24.0,
            ),
            padding: const EdgeInsets.only(
              bottom: 24.0,
              left: 16.0,
              right: 16.0,
            ),
            itemCount: data.length + 1,
          ),
          CurrentSection(data: data[iCurrentSection]),
        ],
      ),
    );
  }
}




class CurrentSection extends StatelessWidget {
  final SectionData data;

  const CurrentSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(16.0),
        border: Border(
          right: BorderSide(
            color: Colors.orange,
            width: 4.0,
          ),
          left: BorderSide(
            color: Colors.orange,
            width: 1.0,
          ),
          top: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
          bottom: BorderSide(
            color: Colors.orange,
            width: 4.0,
          ),
        ),

      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                          color:Color.fromRGBO(249, 157, 54, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Text(
                     "4 quizzes",
                      style: const TextStyle(
                          color: Color.fromRGBO(98, 98, 99, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
