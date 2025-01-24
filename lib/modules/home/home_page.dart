import 'package:flutter/material.dart';
import 'package:nlw_together/modules/home/home_controller.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: Appcolors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(text: "Olá ", style: TextStyles.titleRegular, children: [
                  TextSpan(
                    text: "Gabriel",
                    style: TextStyles.titleBoldBackground,
                  )
                ]),
              ),
              subtitle: Text(
                "Mantenha as suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(0);
                });
              },
              icon: const Icon(Icons.home, color: Appcolors.primary),
            ),
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/insert_boleto");
                },
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Appcolors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  controller.setPage(1);
                });
              },
              icon: const Icon(
                Icons.description_outlined,
                color: Appcolors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
