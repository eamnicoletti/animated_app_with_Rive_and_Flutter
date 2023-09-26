import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;
  late Image bkgImage;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    bkgImage = Image.asset("assets/Backgrounds/logo.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(bkgImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 0.8,
            bottom: 220,
            left: 130,
            child: bkgImage,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 280,
                      child: Column(
                        children: [
                          Text(
                            "Sua aprovação na palma da sua mão",
                            style: TextStyle(
                              fontSize: 45,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '''Resolva milhares de questões comentadas, veja seu desempenho, receba lembretes e interaja com outros 'smarts' como você''',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    SizedBox(
                      height: 64,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                          onPressed: () {
                            _btnAnimationController.isActive = true;

                            setState(() {
                              isSignInDialogShown = true;
                            });
                            CustomSignInDialog(
                              context,
                              onClosed: (_) {
                                setState(() {
                                  isSignInDialogShown = false;
                                });
                              },
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.black87,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Comece agora",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                              ),
                            ],
                          )),
                    ),
                    // AnimatedBtn(
                    //   btnAnimationController: _btnAnimationController,
                    //   press: () {
                    //     _btnAnimationController.isActive = true;
                    //     Future.delayed(
                    //       const Duration(milliseconds: 800),
                    //       () {
                    //         setState(() {
                    //           isSignInDialogShown = true;
                    //         });
                    //         CustomSignInDialog(
                    //           context,
                    //           onClosed: (_) {
                    //             setState(() {
                    //               isSignInDialogShown = false;
                    //             });
                    //           },
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Seja Smart Premium e tenha acesso a +20 recursos exclusivos para impulsionar sua aprovação."),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
