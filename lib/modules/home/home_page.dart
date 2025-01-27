import 'package:flutter/material.dart';
import 'package:nlw_together/modules/extract/extract_page.dart';
import 'package:nlw_together/modules/home/home_controller.dart';
import 'package:nlw_together/modules/meus_boletos/meus_boletos_page.dart';
import 'package:nlw_together/shared/models/user_model.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_images.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

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
                    text: widget.user.name,
                    style: TextStyles.titleBoldBackground,
                  )
                ]),
              ),
              subtitle: Text(
                "Mantenha as suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: widget.user.photoURL != null
                  ? Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(widget.user.photoURL ?? ""),
                        ),
                      ),
                    )
                  : Image.asset(AppImages.google),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
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
              icon: Icon(
                Icons.home,
                color: controller.currentPage == 0 ? Appcolors.primary : Appcolors.body,
              ),
            ),
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
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
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1 ? Appcolors.primary : Appcolors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
