import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introprovider.dart';

class IntroPage extends ConsumerStatefulWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _IntroPageState();
}

class _IntroPageState extends ConsumerState<IntroPage> {
  @override
  Widget build(BuildContext context,) {
    final provider = ref.watch(introProvider);
    return Scaffold(
        backgroundColor: Colors.black,
        body: PageView.builder(
            controller: provider.controller,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            onPageChanged: provider.onPageViewChange,
            itemBuilder: (context, pageIndex) {
              return Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pageIndex == 0
                          ? imageWidget("assets/img/dash.png", context)
                          : pageIndex == 1
                          ? imageWidget("assets/img/dash.png", context)
                          : pageIndex == 2
                          ? imageWidget("assets/img/dash.png", context)
                          : pageIndex == 3
                          ? imageWidget("assets/img/dash.png", context)
                          : imageWidget("assets/img/dash.png", context),
                    ],
                  ),
                ),
                Positioned(
                  bottom: pageIndex != 3 ?
                MediaQuery.of(context).size.height * 0.12789 :
              MediaQuery.of(context).size.height * 0.09,
                  child: SmoothPageIndicator(
                      controller: provider.controller, count: 5,
                      effect: const WormEffect(dotWidth: 08, dotHeight: 08, activeDotColor: Colors.white
                  ),
                )),
                Positioned(bottom: pageIndex != 3 ? 20 : 0,
                    child: pageIndex == 4?ElevatedButton(onPressed: ()=>Navigator.pushReplacementNamed(context, '/login'),
                        child:Text("Done") ):Container(),
                ),
                ]);
            }));
  }

  Widget imageWidget(url, context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      child: Image.asset(
        url,
        fit: BoxFit.contain,
      ),
    );
  }
  }

